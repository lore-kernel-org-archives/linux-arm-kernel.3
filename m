Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDA8C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 00:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nORnCbVbH5mxAliZabDrZOjSHlsyvMySDHzBkM2HwuU=; b=GIxHWQBIs9BpId3ZqBjw3Q0Gkc
	IpGbbKrPA6gC7hVhi5vj8W64sT79+14h9tENb6j11CKNVKBjtCSSbRRlRlDOsyeURjR+ZHXU+QAmy
	i3Fn2IYRjVwgEYa/i+G9IY50Hv14VPOQJoF6oPradZ85+R3z1qNT8piyapNGSGtxeLn3VM+txXe1q
	5T1v9mQQxy6eOUAnFHYAC3VA9GinIi6Yqn8AIyYkvuhEnFcQPMd59ofXh/y9rEX+RaVWs5A1CGiLN
	ITcZAFe0NF4nv0PUh35ruVke+6o2FGCUoLRLk5+pMgIuckKxYk3tX5z87lQJZMXyFt9uSyamYSNAk
	q1XXtw8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2eXh-00000003Wlb-2mwm;
	Sat, 05 Sep 2026 00:46:03 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2eXK-00000003Wka-2rVS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 00:45:54 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id F1A4540E016C;
	Sat,  5 Sep 2026 00:45:33 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 3y-QtSAJBYRS; Sat,  5 Sep 2026 00:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788569124; bh=nORnCbVbH5mxAliZabDrZOjSHlsyvMySDHzBkM2HwuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KeE8Kb2dJnLpc0Ry3NEKvf3vCEVLMrMV5QyBRo0KxYaxV6VWbglrWNnrM8qZ2VlEs
	 ueh8B2nHU+9dRPzuM6kk9rWnQUyj5td8sG11Qu7nvf+nXlKe/Y37FBMmcVj5FAL6u1
	 VT0i/uuIUTac3SnYSaDI641+CO3QgfQkn0KDmsS7SZztN2am2SvPlOLRI3jPEXq292
	 VrTouNMrb/w0olJhxn9MlEoY4GLkSVlXYMDH9IEGfyELbP9kx80sAnZIG9jaZgfq/G
	 74/j2OdNPx3DYb1f+JyjQ/Su6akocpeeBsC+0zjuf4cujmMG/aAKr6vlBeTZKtEHOQ
	 b4iJx2bsGvAkioblq8nCMLSR0DrIOInD52wduSNooIPkeM2v/IbFEWlWc765lHdBgc
	 akFqn4qBCWTPJBkq4l+Df/Vaa92wdDrNZ2kPNXw6di8BuKngMNfUD+QSMuzg6WcV+N
	 rfU4i6KVr+I7GcgHGvcuIGiI+NpnqeUi9TremNXpJTLbQ1z7HgWjDS0eGXtKCWPwhu
	 7XkLHhs+rydTLhEqlSMPr7ObvpPwEKh1jJD/mUSBOF8kD4NhUGM29XP6Akx75CjKXP
	 C+tVq40iIVxeWjYZ1zdIk9Iq5hZe+Ib8qVj5QjnAnD76ty8L9dc4usZ1PIfLT8Ajup
	 6wdQMImKL4K6CzagrtA8O8sE=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 38E8340E01E1;
	Sat,  5 Sep 2026 00:45:09 +0000 (UTC)
Date: Fri, 4 Sep 2026 17:45:05 -0700
From: Borislav Petkov <bp@alien8.de>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Ben Horgan <ben.horgan@arm.com>, x86@kernel.org, james.morse@arm.com,
	fenghuay@nvidia.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, tglx@linutronix.de,
	mingo@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com,
	corbet@lwn.net, linux-doc@vger.kernel.org, dave.martin@arm.com
Subject: Re: [PATCH v5 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time
 conversion to be per-arch
Message-ID: <20260905004505.GAaptmEVxltONVfl2J@fat_crate.local>
References: <20260709093111.367851-1-ben.horgan@arm.com>
 <165e7636-d7e9-4d16-aad1-657b4a9698d0@intel.com>
 <b0a7035e-7ffe-4e22-a4ae-a177640234b8@intel.com>
 <20260904033751.GCapo9D5ZZXWuQkIpc@fat_crate.local>
 <20260904173615.GOapsBjyiT7uXHd-Qc@fat_crate.local>
 <35ebb8d4-2ef0-4bc0-ac3f-afff0c95ae89@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <35ebb8d4-2ef0-4bc0-ac3f-afff0c95ae89@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_174545_921082_EC2EA485 
X-CRM114-Status: GOOD (  12.79  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 04, 2026 at 02:15:08PM -0700, Reinette Chatre wrote:
> Sashiko's second comment is about resctrl's existing (not introduced by this patch)
> Intel specific enumeration being resilient against a hypervisor misconfiguration.
> Thus far resctrl assumed the enumeration would return what the actual hardware
> is known to support.
> 
> Sashiko had similar "hypervisor misconfiguration" comments in response to another
> resctrl series that already falls under the "cleanup" umbrella. It is not clear to
> me how far resctrl needs to go to be resilient against hypervisor misconfiguration
> but I can include needed validation addressing this report as part of [1]. 

I would always ask myself how realistic is the use case. Here, I'm thinking
not that realistic unless you guys wanna support resctrl in a guest. Which
would be weird, IMHO, because a guest can fake all kinds of hw so controlling
resources of a fake hw is an exercise in futility.

So might as well answer that Sashiko review comment with "thanks, but no
thanks."

:-)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

