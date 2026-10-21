Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30775606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 06:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KMKJqOX7;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LN7Z+wTU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ERCu28HOlccXBiT0hxEnKDMxA84fNeRxo/vPze54s84=; b=KMKJqOX76HVWwe481wjUMlVFjb
	OQF8bFAsJ86IH3gsZIk5E2x14FfaRS0sOX1yaQN26+nUHl4LXu0BFiuKVbmumn+RE6q68s851WmYK
	YGg02tXR29WzeAblohnWA1IBQFfe79Y6YBndJfFzBwWO1bVlciEBkC0aPMkE6ZanBTvUuRvqcJ02Z
	FpsW6PuCyZJ0mHViCt1sN1q3BO28lsUrSfnxiRgNaVquC2lvHDUihEXJ7Mw5iseGJlaYoo/LP9vsa
	STfao1+1RfEvagqmLSR6PBF1kVQRfoT/icYGQVEqegHhhaDpY3SdrpSs9iRME2n2M0h2ku8PGNnV1
	U9ErxHAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQ7m-0000000BCca-2KA0;
	Wed, 21 Oct 2026 06:48:36 +0000
Received: from out-5.mta0.migadu.com ([2001:41d0:1004:224b::5] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQ7j-0000000BCbO-10EG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 06:48:33 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ERCu28HOlccXBiT0hxEnKDMxA84fNeRxo/vPze54s84=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792565309; v=1; x=1793170109;
 b=LN7Z+wTU4LbsAlrEhrHk7tOV/1RoKGGEBz+pmbNleJa6Ry+BxnRD7G2iQ8/+cbm9leSYAp+y
 nGYzRYGreZD7mdqUQSg797epLoV1jEUtysacpIMmbJPy2nCSaAfACQLUtCw0S65W8zMlNPDyj4h
 ejNvsFmxidzVz3jL88/sRrrg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d1f697374401ddca;
	Wed, 21 Oct 2026 06:48:29 +0000
X-Mizu-Trace-ID: d1f697374401ddca
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be4a7b9e6fso3817e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 23:48:28 -0700 (PDT)
X-Gm-Message-State: AFq9FYJPmWoIMiHwO1zudmLNdjNuQp5mz/+SrmVX3AOas6qp1tiVz2AS
	SgUVr30K0LrZ+di05001gaMp/tpCS7xfmRivcP45jNBIZp024SQTEp9R/kMS1PDcIS7iwbh3sjN
	8K7DT0huezqwmhiyI8i2GKo9XKJfCoDG7n7zPNdzi
X-Received: by 2002:a05:6512:290b:b0:5bf:63a2:27fd with SMTP id
 2adb3069b0e04-5bf63a22a04mr171664e87.1.1792565308065; Tue, 20 Oct 2026
 23:48:28 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020163923.1407856-1-sascha.bischoff@arm.com> <20261020163923.1407856-3-sascha.bischoff@arm.com>
In-Reply-To: <20261020163923.1407856-3-sascha.bischoff@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 21 Oct 2026 07:47:51 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx5Gk2aBFUAzAP8pa_kggwPhoJOvkCT6YtLg0dbQEBSZQ@mail.gmail.com>
X-Gm-Features: AclHuK_-J6_HJSmrppsH8jrPBh30NkV5zsuQqfHdht3jCK3LseUqzQwdv9UJsgk
Message-ID: <CA+EHjTx5Gk2aBFUAzAP8pa_kggwPhoJOvkCT6YtLg0dbQEBSZQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] KVM: selftests: Reject GICv3 ITS with a GICv5 VGIC
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_234831_417605_4E623B27 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 20 Oct 2026 at 17:39, Sascha Bischoff <sascha.bischoff@arm.com> wrote:
>
> Check that a GICv3 ITS and a GICv5 VGIC cannot be paired, regardless
> of which device is created first. Skip the check when the host does not
> expose a GICv3 ITS.
>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>


Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

