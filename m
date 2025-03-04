Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B67C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 06:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nD2IpkXkau4WZUb38wSv5b3eflHb98MypZT0H60FFg=; b=iPRqcyv+MmvjsYtmqIWYge56SR
	nk2qwya2iiWLc/1t/RhTCCosIw2bKMHD8IF2iJoLo0MiakkgLlC213EgxS4VTdPAYFLV2ceDN4xrr
	1DhIJ47cKMlT4QNAWFYJKvLNZNrNVH+gQsnmckwL9qiwgIPfdUJWcRuybHHIbh0fqftoeSgvMo/UW
	olVHXxgqH7rEnEqYfqtCo1AeywLBFf95rIve/cmEoXp2xIgPzuMXDQW+24e1xcsXRU1lup8ZE3H/z
	v5IzWG6dOItM3mgi5b4EOg8MzlYEweAAlnsUilNRlW0Y0S8ZxNfQ2CZUZxHMnJQqOiYjf1TW14Shz
	CNxH6XFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpMFI-00000003NAD-04U5;
	Tue, 04 Mar 2025 06:59:16 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpMDg-00000003Mxp-3PaI;
	Tue, 04 Mar 2025 06:57:38 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1741071454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8nD2IpkXkau4WZUb38wSv5b3eflHb98MypZT0H60FFg=;
	b=lDzKW4rRCXkn4A9giJuVYXk/56OSuMDeqWKuBKTKaAClAxGeLBBF9W47S230gt0MWAhk3F
	YqPOG1FKZIVKHOoVfOYADY5IpGhwPnVT4jexj4LLepZOFzlvrciptSUL9hwsfKGDipKXoh
	d+26AMvkJzxfsi35CgFrMIYtJULL/DpfNGDo5BK4pyp1E8g4GHyBF6N9hHoZUIqrfH5v9G
	eWJudVjnXxT6G4KpViWTpSiegwDL+qsBXbTGHVkxmJSmclq91bsd7ULkG163sEwzO2+ob0
	ACdr9FE+3HARZvksja5hVH+Wp73Gla89bYGUmTBOAd/pKA0UFhwvh7aOqc9eEg==
Date: Tue, 04 Mar 2025 07:57:34 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, didi.debian@cknow.org, chris@z9.de
Subject: Re: [PATCH v2 0/2] Slightly improve hardware description of Pine64
 RockPro64
In-Reply-To: <757afa87255212dfa5abf4c0e31deb08@manjaro.org>
References: <cover.1740941097.git.dsimic@manjaro.org>
 <174104113599.8946.16805724674396090918.b4-ty@sntech.de>
 <757afa87255212dfa5abf4c0e31deb08@manjaro.org>
Message-ID: <dff9509bcbe9be10b2df454c2dabc289@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_225737_159903_F61C01B1 
X-CRM114-Status: GOOD (  21.66  )
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

On 2025-03-04 07:44, Dragan Simic wrote:
> On 2025-03-03 23:36, Heiko Stuebner wrote:
>> On Sun, 02 Mar 2025 19:48:02 +0100, Dragan Simic wrote:
>>> This is a small series that introduces small improvements to the way
>>> Pine64 RockPro64 [1] single-board-computer is described in the DT 
>>> files.
>>> This applies to both production-run revisions of the RockPro64.
>>> 
>>> The introduced improvements boil down to eliminating some warnings 
>>> from
>>> the kernel log, by adding a previously undefined regulator and by 
>>> adding
>>> some previously missing references to the regulators.
>>> 
>>> [...]
>> 
>> Applied, thanks!
>> 
>> [1/2] arm64: dts: rockchip: Add avdd HDMI supplies to RockPro64 board 
>> dtsi
>>       commit: bd1c959f37f384b477f51572331b0dc828bd009a
>> [2/2] arm64: dts: rockchip: Add missing PCIe supplies to RockPro64 
>> board dtsi
>>       commit: 64ef4a4320e7aa3f0f267e01f170f52b90bf0b1b
>> 
>> I've moved the pcie12v supply up one line.
>> While in a mathematical sense it's true 12 > 3.3, we're sorting
>> alphabetical, so it's 1?? < 3?? .
>> 
>> And yes I sympathize with 3.3 < 12, but also have come to appreciate 
>> not
>> having overly many special cases :-)
> 
> Great, thanks! :)
> 
> I'm fine with the alphabetical ordering, albeit with some caveats
> described below, but the following part of the patch description
> should also be removed, if possible, so the patch description fully
> matches the introduced changes:
> 
>   Shuffle and reorder the "vpcie*-supply" properties a bit, so they're 
> sorted
>   alphanumerically, which is a bit more logical and more useful than 
> having
>   these properties listed in their strict alphabetical order.
> 
> Admittedly, the patch itself indeed looks nicer [1] with the
> alphabetical ordering, :) (which is quasi-alphabetical, actually,
> please see below) but it might be better to have the DT guidelines
> adjusted to specify alphanumerical ordering as well.  Even ls(1)
> can sort filenames alphanumerically, with its "-v" option that
> performs "natural sort of (version) numbers within text". [2]
> 
> The real trouble is that, if we were to apply the alphabetical
> ordering strictly, we'd end up with the following order of node
> properties in which 12 is before 1.8 and 3.3, which IMHO doesn't
> make much sense:
> 
>   vpcie0v9-supply = <&vcca_0v9>;
>   vpcie12v-supply = <&vcc12v_dcin>;
>   vpcie1v8-supply = <&vcca_1v8>;
>   vpcie3v3-supply = <&vcc3v3_pcie>;
> 
> I'm hoping you'll agree that specifying alphanumerical ordering
> for the properties in the DTS coding style is the way to go, just
> like it's already specified for the ordering of the nodes.  I'll
> go ahead and submit an appropriate patch for the DT guidelines.
> 
> [1] 
> https://web.git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?id=64ef4a4320e7aa3f0f267e01f170f52b90bf0b1b
> [2] https://man.archlinux.org/man/ls.1.en#v

For future reference and for anyone interested, here's a link to
the above-mentioned DTS coding style patch:

https://lore.kernel.org/linux-kernel/09d6f2fc111b3d6e58987336944f93ec36b65118.1741071107.git.dsimic@manjaro.org/T/#u

