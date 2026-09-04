Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64049C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 03:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=puQU8kxmxcVlZJ33kJImb3eTEgEbDYI/ctH1clNKuRE=; b=MHWy069X9xiaciF2OjJPXbr5AL
	MQ8NJSI7LwyvnBiqNJYXBli6aD7UUhjTlURV83lbx1UBtYI66wfk3ybXBo+oYJWtrMUlQzXqkISGa
	rU+vcrus3dYA/huZ4olG1M9HYXE9+MNEKtrApY/UrmSn/FURPOebJYIa1a/1r1ABGFD2Y2q/z1SIJ
	GVQFcQNC9XLtxhlCPMlVgkuSPjgihkIKUDTkNULs9U5E4waJepZb7IfMFnrtG150tK+U4saeFOk7p
	cA8HRUB/y9Gd+RdEjjThcMYMibk+kF1lh1XGTCb8vWYu/i+IF3DPW9wkILpMcoyOH0cA7FG5XYp+P
	nfTVCvUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2KlG-00000000wJK-0GFR;
	Fri, 04 Sep 2026 03:38:42 +0000
Received: from mail.alien8.de ([65.109.113.108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2KlC-00000000wIg-1ZWY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 03:38:40 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3719A40E016C;
	Fri,  4 Sep 2026 03:38:19 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id OunsccZEpS6a; Fri,  4 Sep 2026 03:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788493089; bh=puQU8kxmxcVlZJ33kJImb3eTEgEbDYI/ctH1clNKuRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z7s8VEGGVGNdr03uNrd96I2wtGpHKZ8FXvGtwCm89Igi4AoWxSUuxBOrt55qH/wme
	 52QFiFEO6iavP5aJOq+MTUekz191tC7puYD38DuCcad3FeKhHiORwKjNcQMfxfa1cr
	 HM4gnLJMn5YfYrDMjH9Tb/GVT2FwhakvbHyMbY9+7qjx+TOyLt+2WrWrwhZAZv/852
	 /aJAdiXktBL0Ikd/DmOOukjgL8qUDSn0O91/wZhHs1rOLQrqmuI0EZjdJAcz2zPBnI
	 53feFWzvRaLp0TQQFlEmtz/zzjkOmh6Xgu4iaXfntnUzUnQQLczfNKEZOoLZ+NIoUa
	 LHX7+Z3h20SzwOU5EmVrwwOv9A3J4cgeXg1AGEn+IlCO9mTNFa3E+h6zN4qxmW9ncr
	 NcITqx+cfbmv186YVAE6NiV/JU+PmiBr+kQ/+BkYFNJYzL14OnYrvZ7Ac8sCSU754E
	 PLXGFwKF8o9Ed46XzzqKn3ZD7D4dm68vL2ZRKjBKdbkV0sU3EQ9HLz2SOZWNCbL2te
	 lu8/AayQg8Pao0P9DUeq//3NP6ZZjCakudWlrisMUaLoTUmmLNQ7HjxuFtYgpPEq/D
	 HcX8x6MS3hGNC2tWKKHlEVvqOtMXbl9UVuyZhfyDbd67U8GXDRUsULJjwkx332iRze
	 Fht+vggHmVFBILqhx/V0d+Oc=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8CBD240E027F;
	Fri,  4 Sep 2026 03:37:54 +0000 (UTC)
Date: Thu, 3 Sep 2026 20:37:51 -0700
From: Borislav Petkov <bp@alien8.de>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Ben Horgan <ben.horgan@arm.com>, x86@kernel.org, james.morse@arm.com,
	fenghuay@nvidia.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, tglx@linutronix.de,
	mingo@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com,
	corbet@lwn.net, linux-doc@vger.kernel.org, dave.martin@arm.com
Subject: Re: [PATCH v5 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time
 conversion to be per-arch
Message-ID: <20260904033751.GCapo9D5ZZXWuQkIpc@fat_crate.local>
References: <20260709093111.367851-1-ben.horgan@arm.com>
 <165e7636-d7e9-4d16-aad1-657b4a9698d0@intel.com>
 <b0a7035e-7ffe-4e22-a4ae-a177640234b8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b0a7035e-7ffe-4e22-a4ae-a177640234b8@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_203838_589797_72EF5349 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

On Thu, Sep 03, 2026 at 08:40:48AM -0700, Reinette Chatre wrote:
> Could you please consider this series for inclusion during this cycle? It applies cleanly on
> top of v7.3-rc1.
> 
> Please do let us know if you have a preference for how changes touching all parts
> of resctrl (filesystem, x86, Arm) should be handled.

Lemme have a look.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

