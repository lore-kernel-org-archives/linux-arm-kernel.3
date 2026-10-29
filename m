Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CF7606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bTJVtu3a;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=t6a9PSBl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=P8sAw5ur2lstKWkCV1NN3TteySnzETKS77xqYaYoeEY=; b=bTJVtu3aJzCkIjKOK+m3s9wQT7
	1194vTr+5Mrs4orHghN5ybYUeQc/LgZWc+BFm2yos2TXk053moSJrrzG89YB1svVtOZh9JX7L38xf
	Mqd7wriw+1z6EVuAuuuboAfwz3MV+AKp4z94GJOXalO64xQhhSyxjH6La+06SKzZ7Sdyp4Mn7qCSr
	GGvL7xE9OFjFAxOMX7tqnhmNW5t35FubRuKwgFwA1xbEnNRNjw0YlBuX/g0Zz6rrkIPNm0UJTL4pb
	VXZJ69n44T5eLv0cPWKD9AgJt2YXP2EtiEYlarlNrrlsFjWhyXQ0EQplgbp+oU8ajMNrkz2nrWpGb
	X3HziwNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV2l-0000000A8Ge-1ELo;
	Thu, 29 Oct 2026 18:40:07 +0000
Received: from out-228.mta0.migadu.com ([2001:41d0:1004:224b::e4] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV2i-0000000A8Fg-1RIk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 18:40:06 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=P8sAw5ur2lstKWkCV1NN3TteySnzETKS77xqYaYoeEY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793299198; v=1; x=1793903998;
 b=t6a9PSBl4enjIZvZUgCJyobtTBoRxozb1frOF1fvvA3HOVr+ROd1zIHfrqDefJSytPK/eWLk
 SrA3Zdg8C5RslKMSIB5HB4ShQzDM8xUAb/oCww0H25kpof9+yH3zJu09fpycc7ja6E2QevKEjDw
 nRqYC7lPf0BsBMHwYnyMbu1E=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id fe1b0555b7c16156;
	Thu, 29 Oct 2026 18:39:58 +0000
X-Mizu-Trace-ID: fe1b0555b7c16156
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be3b2f17c1so1354e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 11:39:53 -0700 (PDT)
X-Gm-Message-State: AFq9FYJ5hzcj2e8aOdXBO7eE9y7Zfezlyiacnf0Bi7HVbud9VGcCz/GU
	t2JlnLMSVItBhhg4dlnB7laxLTquf0diA2WRGF0Av15LVidGj6fpohDLvkxVCJCRNGqvmUWqvb6
	ajjPSmnBnbdCJlut4OLcKDwicddTW2kNA5DXRXlTn
X-Received: by 2002:a05:6512:1383:b0:5bf:cea4:4150 with SMTP id
 2adb3069b0e04-5bfd140feebmr228838e87.5.1793299192378; Thu, 29 Oct 2026
 11:39:52 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029175238.3214788-1-weilin.chang@arm.com> <20261029175238.3214788-3-weilin.chang@arm.com>
In-Reply-To: <20261029175238.3214788-3-weilin.chang@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 29 Oct 2026 18:39:15 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzBB05GZdz6be0uqHFs7sK1879yBVDJrEqKrTtM8=_Lyw@mail.gmail.com>
X-Gm-Features: AclHuK_Wm_aye4dCeSRhGryTZlCEP8KkPO9b0e0oBdSMGn1JW0SmL7sHjZoHOTw
Message-ID: <CA+EHjTzBB05GZdz6be0uqHFs7sK1879yBVDJrEqKrTtM8=_Lyw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] KVM: arm64: Remove stale remark on canonical IPA alignment
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Gavin Shan <gshan@redhat.com>, 
	Leonardo Bras <leo.bras@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_114004_874239_8A30BA04 
X-CRM114-Status: GOOD (  10.92  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026 at 17:53, Wei-Lin Chang <weilin.chang@arm.com> wrote:
>
> Commit 3b8ce2b5132ae ("KVM: arm64: Use a variable for the canonical IPA
> in kvm_s2_fault_map()") created a variable to store the canonical IPA,
> instead of calculating it when needed. It moved the aligning just before
> mark_page_dirty_in_slot() to an earlier place but did not update the
> comment.
>
> Remove the stale part of the comment.
>
> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

