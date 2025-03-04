Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FEEC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 06:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FmcbSR4fpWNtNMrwgorLBn1ejOQXpMGWv3rjGuDsu/0=; b=WelX0dso0sh9APy88kE58NW7Wt
	b3oPtHLbrt87xdKgwQ5PPwtId6GaPAqnKLp0r5jas3XNNitC/tQHa9xOdTjndJLL9daUJ9qZBAeQQ
	KbCa9NVKzsaE5OHxQA4QlaL4qW3XZzq6IfZHK9UH0bq7feVmnNW+jz1YT5O3FTS4NNOeuZhgD/4KY
	F3pXZp6iTMqFTgkSupVSomSfhVMSDuygOaBcgwzbpkseKav6PqjD+bGrKxE2AOfY+wZDKR7QwuhUl
	tBEJPJJ/+uQFDzeV8HZZ55hPXUp4LPCGXPKgoNwkfSnMQa6b1WWpnlAzjK9aXNs5TO3RRPKBKP/5g
	C1iApMAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpM5v-00000003LhN-3f7p;
	Tue, 04 Mar 2025 06:49:35 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpM1Y-00000003KX3-3IEI;
	Tue, 04 Mar 2025 06:45:06 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1741070700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FmcbSR4fpWNtNMrwgorLBn1ejOQXpMGWv3rjGuDsu/0=;
	b=KafPlS2cao/nkE3TIuUzFLvT/erara6+Y2BEZ2H14/Uo4qNsaWXNGS1U/c0NA+apCFUMYD
	mc/rMiELEMkWa2jYe47TPRaf5zdIK08Ge7Dl/okrH2n8ARTId8mocZOSJ2bl4855JE/LWK
	zQ0brIW4olIAMQgBSr1nCY+18N/pF83NiANjO+VHS9qUdPBtbI/GVZrvojeuMOyS0dsPcb
	ZA03r/0K6Lfzmn4xoZVvbTvPq3kbyE9q2sXdtNr86zrY7hNP+cEFBQk6IfIlxV1V8ix+IF
	S6mVe4bhchQ9jFB6A4vxIvAU28cUUidKev16wn6QhBqUGe6EsyBe0jOM6Id83w==
Date: Tue, 04 Mar 2025 07:44:59 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, didi.debian@cknow.org, chris@z9.de
Subject: Re: [PATCH v2 0/2] Slightly improve hardware description of Pine64
 RockPro64
In-Reply-To: <174104113599.8946.16805724674396090918.b4-ty@sntech.de>
References: <cover.1740941097.git.dsimic@manjaro.org>
 <174104113599.8946.16805724674396090918.b4-ty@sntech.de>
Message-ID: <757afa87255212dfa5abf4c0e31deb08@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_224505_124171_2882E5A2 
X-CRM114-Status: GOOD (  18.14  )
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

Hello Heiko,

On 2025-03-03 23:36, Heiko Stuebner wrote:
> On Sun, 02 Mar 2025 19:48:02 +0100, Dragan Simic wrote:
>> This is a small series that introduces small improvements to the way
>> Pine64 RockPro64 [1] single-board-computer is described in the DT 
>> files.
>> This applies to both production-run revisions of the RockPro64.
>> 
>> The introduced improvements boil down to eliminating some warnings 
>> from
>> the kernel log, by adding a previously undefined regulator and by 
>> adding
>> some previously missing references to the regulators.
>> 
>> [...]
> 
> Applied, thanks!
> 
> [1/2] arm64: dts: rockchip: Add avdd HDMI supplies to RockPro64 board 
> dtsi
>       commit: bd1c959f37f384b477f51572331b0dc828bd009a
> [2/2] arm64: dts: rockchip: Add missing PCIe supplies to RockPro64 
> board dtsi
>       commit: 64ef4a4320e7aa3f0f267e01f170f52b90bf0b1b
> 
> I've moved the pcie12v supply up one line.
> While in a mathematical sense it's true 12 > 3.3, we're sorting
> alphabetical, so it's 1?? < 3?? .
> 
> And yes I sympathize with 3.3 < 12, but also have come to appreciate 
> not
> having overly many special cases :-)

Great, thanks! :)

I'm fine with the alphabetical ordering, albeit with some caveats
described below, but the following part of the patch description
should also be removed, if possible, so the patch description fully
matches the introduced changes:

   Shuffle and reorder the "vpcie*-supply" properties a bit, so they're 
sorted
   alphanumerically, which is a bit more logical and more useful than 
having
   these properties listed in their strict alphabetical order.

Admittedly, the patch itself indeed looks nicer [1] with the
alphabetical ordering, :) (which is quasi-alphabetical, actually,
please see below) but it might be better to have the DT guidelines
adjusted to specify alphanumerical ordering as well.  Even ls(1)
can sort filenames alphanumerically, with its "-v" option that
performs "natural sort of (version) numbers within text". [2]

The real trouble is that, if we were to apply the alphabetical
ordering strictly, we'd end up with the following order of node
properties in which 12 is before 1.8 and 3.3, which IMHO doesn't
make much sense:

   vpcie0v9-supply = <&vcca_0v9>;
   vpcie12v-supply = <&vcc12v_dcin>;
   vpcie1v8-supply = <&vcca_1v8>;
   vpcie3v3-supply = <&vcc3v3_pcie>;

I'm hoping you'll agree that specifying alphanumerical ordering
for the properties in the DTS coding style is the way to go, just
like it's already specified for the ordering of the nodes.  I'll
go ahead and submit an appropriate patch for the DT guidelines.

[1] 
https://web.git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?id=64ef4a4320e7aa3f0f267e01f170f52b90bf0b1b
[2] https://man.archlinux.org/man/ls.1.en#v

