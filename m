Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD16606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 10:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o3Ieqy93;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vfClfbAy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cLLRVkOcST0DyQ8J/JKflZi0Zz/mIu85uAsHsW1TVFg=; b=o3Ieqy93qbSlNT3DwnD5qYRxn4
	LV+NcKsNsXLton8u6ijVRbdVCz3NgwtXTG9MPVlUUjX8PbPZ1pgkfRYFrC34DQVn9gg6V9zSglBnH
	TYkWAE8+UaUdFftr3Hhm/kHqUMG8UHz/VBmPNVybjHBR1cmXZ+9d9mGIKodHvftTSWIPXStgAlUQk
	tLdC0tK91hBtekvyvEjt34rYUYGHLQbsLW1oc6jGGWQOfavs5z+GCGP7TLi+mKt0i9ALItKTYr66Q
	U+R2FEzfqJcPuWKHItrqOJH/PKLMryDZKVYQNpTPYIc9OAg0xphjfpv+TDFUkme7im/pClQQC6Pau
	AKuuzF9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCfQ-0000000GAwy-2Dke;
	Fri, 23 Oct 2026 10:38:32 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKCfN-0000000GAwV-1H3F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 10:38:31 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=cLLRVkOcST0DyQ8J/JKflZi0Zz/mIu85uAsHsW1TVFg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792751905; v=1; x=1793356705;
 b=vfClfbAyy9W87INmPAnQRLdM7z9pEaINPiM00p1v2g0GLj9r6L0GQpWJqxVXwZS/0RGLvLJ9
 sEJERkcBQ/Pz5i08ZdfzIHlsMTNCsqw3Nn295gHeRd92clsIhEipEMAdh4OJnysnDPPgKmhN38t
 RzcLV0+K9oNUXatYiIrgR4K8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4987b933e0f41774;
	Fri, 23 Oct 2026 10:38:25 +0000
X-Mizu-Trace-ID: 4987b933e0f41774
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bcbb378fc9so6914e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 03:38:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzP1HI7SrYXw0qOd5wskyptDi6VEYbfiWGaNyZjDjzEPZNXIRyWkKpc0DUNBcE/cYEIHre77mzMfX+FWFYSEppO@lists.infradead.org
X-Gm-Message-State: AFq9FYLxmU5aTgUGB5fcfLnhZlmxl1bbhoHs3a6+uyENONE14+x+II43
	twoj0Iu0LCQfvZWzfrcmII5SewhT3Zqlag7v/rtW3UP/3L9v/aeSuxd053woJvkGK+QM4C68k5z
	nuiQMjLWCJeQw3K44fEc4AjBDwKmeDNZNncPDZA1N
X-Received: by 2002:a05:6512:3e26:b0:5bc:fbf6:2352 with SMTP id
 2adb3069b0e04-5bfb06d38a0mr119014e87.9.1792751904240; Fri, 23 Oct 2026
 03:38:24 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023070110.1833446-1-fuad.tabba@linux.dev>
 <20261023070110.1833446-2-fuad.tabba@linux.dev> <86fqxwzul7.wl-maz@kernel.org>
 <CA+EHjTw08SZC_3Uodt6ew6vXVH-doW-8G41fVCF-rmaKsv+0fQ@mail.gmail.com> <86ecdgzp6m.wl-maz@kernel.org>
In-Reply-To: <86ecdgzp6m.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 23 Oct 2026 11:37:47 +0100
X-Gmail-Original-Message-ID: <CA+EHjTy0jpY3sdVCENJRj_kfRDwbZ6TpkCAHQ2xUO-7ZuErpcA@mail.gmail.com>
X-Gm-Features: AclHuK-Z7-qsjF596RnJ21sZzB7mzj2vXd60dbcKuOxyJq8KgdnvpDHBkQR87RQ
Message-ID: <CA+EHjTy0jpY3sdVCENJRj_kfRDwbZ6TpkCAHQ2xUO-7ZuErpcA@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: arm64: Hide FEAT_LS64_ACCDATA from guests
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Arnd Bergmann <arnd@arndb.de>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_033829_746894_7261EB0F 
X-CRM114-Status: UNSURE (   9.23  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Marc,

On Fri, 23 Oct 2026 11:28:17 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> No, I want this fixed by enabling ACCDATA support by default, which is
> what we have *already* promised to userspace, and see the fireworks.
> You can add an arm64.nols64 kernel option if you want, which is
> consistent with what we do for CNTPOFF, NV3, and other extensions that
> depend on FW enabling them.

Will do. v2 will have your patches 3 and 4 from [1] rebased, EnAS0 set
when the guest has LS64_ACCDATA, and an arm64.nols64 option.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20240815125959.2097734-1-maz@kernel.org/

