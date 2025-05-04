Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFEFC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 17:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qdbkj5zGjlwWFJ+oyhoB1B00ZWRKRitXty6DWNEWzc=; b=U2asKoQKDnURpdhWSi2F3yrRFR
	/7JFjk0/yIin6k1sXBeYiqKi1i4+x+GLOF1s4ODqavRtSUKFl+8lvimFZZfYcPxO/Ac9saMnQNzUf
	W1SHavXCJ/qVoD14cf3dWGwJ9e0SfRdF6wG+Zj2buJXkYOSzLcXnrF3RZ43gExbbl9GaS1/XF7R3s
	LyRNvDHHSTOE2j+aFYfhRa3LkAj9ZgPZK7xhqHaWIZhFmufRHUZsw3Htgb/MmG39ajR5oIVJxR3b9
	wW1M2TCK4bv4pzIt5qtCAgWErSEANTiDoNUsH5bA0I7dXvsSJojh2/Em6dl3tU9VlCzf1ZrFqhDzP
	JoPaEBXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBdWW-00000005lzV-0kdY;
	Sun, 04 May 2025 17:53:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBdUX-00000005lj6-2ocG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 May 2025 17:51:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B22DF5C5423;
	Sun,  4 May 2025 17:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB47C4CEE9;
	Sun,  4 May 2025 17:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746381064;
	bh=LYejNqAF7mFzd0DoH7tOPP4SnFsHrCVcN3FViu8lKHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oyoYjb+00MS71Q1iEk+OZBdQdzv3hJZH9AYOTLjTgobvvSOWWAt5SSyTEDzWUHKXG
	 IDRQDFJ4mi7FTPnvjPNuS0DlrDZWPAocIBHmyqTc4W1SN2HOpr9r0TUuAU8kCGPu8W
	 j/rQ/uvoXfe+r3+9FbJYbBW05pgcAFcXTFE8uWwvQx+7dCtGqAjMa4vFyPRbksUD+i
	 dyoE5BFbWZszw2TdNW4VMDwKKMawIb8HB90e+0Sl5JBP53EKpI6klJYcYc2SnPN054
	 LGW4IR1N8ug1qfZMexYflJ6hAlHDkt5V0NHHdLI8sqygyFHX8nl3z56fMuTTLXx7+f
	 GoT/LsOGNdoXQ==
Date: Sun, 4 May 2025 19:51:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, 
	jonathan.cameron@huawei.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxarm@huawei.com, mark.rutland@arm.com, 
	shameerali.kolothum.thodi@huawei.com
Subject: Re: [PATCH v2 6/6] of: of_cpu_phandle_to_id to support SMT threads
Message-ID: <20250504-acoustic-skink-of-greatness-1e90ac@kuoka>
References: <20250502161300.1411-1-alireza.sanaee@huawei.com>
 <20250502161300.1411-7-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250502161300.1411-7-alireza.sanaee@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_105105_752211_A135597B 
X-CRM114-Status: GOOD (  17.88  )
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

On Fri, May 02, 2025 at 05:13:00PM GMT, Alireza Sanaee wrote:
> Enhance the API to support SMT threads, this will allow sharing resources among
> multiple SMT threads.

<form letter>
Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument, so you will
not CC people just because they made one commit years ago). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about 'b4 prep --auto-to-cc' if you added new
patches to the patchset.
</form letter>	

> 
> Enabled the sharing of resources, such as L1 Cache and clocks, between SMT
> threads. It introduces a fix that uses thread IDs to match each CPU thread in
> the register array within the cpu-node. This ensures that the cpu-map or any
> driver relying on this API is fine even when SMT threads share resources.
> 
> Additionally, I have tested this for CPU based on the discussions in [1], I
> adopted the new cpu-map layout, where the first parameter is a phandle and the
> second is the local thread index, as shown below:
> 
> In the CPU map, there are two cases that only one occurs at at time.
>     1) "cpu" = <phandle>
>     2) "cpus" = <phandle> <index>
> 
> The first case addresses non-SMTs and the second case addresses SMTs
> that the variable must be cpu(s) with an index where we later look up
> the reg array with that.
> 
>     core0 {
>       thread0 {
>         cpus = <&cpu0 0>;

Not so sure, dtschema says only one item is allowed in the phandle and I
do not see here binding change.

Although this wasn't even sent to me, so I'll just ignore your patchset.

Best regards,
Krzysztof


