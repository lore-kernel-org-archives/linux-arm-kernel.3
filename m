Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D2C606D801
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 15:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zOFBdOw8;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Q9afwz7J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=f4rms8U7zLHCSMuZUidm8eBtD75JSPsJZXcDQYSok00=; b=zOFBdOw8/pSAJ9
	aQKbQUG/H2HvI6BsThoGZoDF9wDFXGahgS/zJ8kyajhyjgB9q1unbyLVsT6Z41yk04DA3suEEzDBp
	430OLUvtWoW35nJDRYlyDq2tBlffY/oGIykmi1O6jGQzIAyV6hMobZUuOwMrKq28BDqlXUtq8lo2k
	4jtthiucSilS2fmaZZtSYSR2ixkXHT0mmSYRBPsJP49XHCzatwwd7JDggdZo8QroLu9ZvUVQiXWEc
	cQlWQuUq3m/M7SMlrsSJ/ef4eF95PJbxc8Jck4f37SnRl66VXqfTWZ89y+YxPKR7mA5ya78SOxktn
	SXQuuaTa0JwBQ4ZgX8Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuC8-0000000HBnK-3r17;
	Mon, 02 Nov 2026 15:43:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNuC4-0000000HBmb-4BrD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 15:43:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D50AB1691;
	Mon,  2 Nov 2026 07:43:28 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C7E73F673;
	Mon,  2 Nov 2026 07:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793634211; bh=LoDP/ozuXN4coqSNOir7+A9+NIl8WuJukf+q/Sdudu0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q9afwz7JF+IVBEa+kEt0naITPT47mOKEfUBRn2m8LknqoOVM21B/2+C5xRjxu8p35
	 TYJaEzhhQsUBz/z/c1moKyRP6rC0sgIKlwuq4EcGA1bUuYAQN9DOe/uFwBiq+Wm/tV
	 lkZ1+jCuc3IhDePlC8FGQb3xoCGIVihy5RI8Tdlo=
Message-ID: <b63fb278-6d75-4bcb-a23f-abe80edf2837@arm.com>
Date: Mon, 2 Nov 2026 16:43:24 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/8] clk: sunxi-ng: a733: Add mod clocks support
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Enzo Adriano <enzo.adriano.code@gmail.com>, linux-clk@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech>
 <20261009-a733-clk-v6-6-ae8178fce7e8@pigmoral.tech>
 <20261028180913.2829389-1-vinicius.eduardo.pedrosa@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261028180913.2829389-1-vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_074334_784395_C6F6C90E 
X-CRM114-Status: GOOD (  17.27  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vinicius,

On 10/28/26 19:09, Vinicius Pedrosa wrote:
> Hi Junhui,
> 
> In patch 6/8, usb2-u2-ref is declared as a plain mux, but the manual

can you please reply inline? Copy the original email, then reply after 
the code that you have a comment on? See the other replies on this 
series for examples.
After all this is the reason we do this patch-inline-in-email approach 
for review, so that the context is clear, and makes it easier for the 
author, other reviewers and maintainers to follow the review comments.

Subscribing to the linux-sunxi list is probably the easiest to get the 
emails, or use lore to fetch the respective emails. For one-offs you can 
also download the mbox file from lore, then import them in your email 
application.

Cheers,
Andre

P.S. This applies in general to your email replies, I see them as 
completely from scratch text, just with the right In-reply-to header, 
but without any context.

> has a gate at bit 31 of 0x1348, and its reset value is 0. So the CCU
> driver can't enable it.
> 
> -static SUNXI_CCU_MUX_DATA(usb2_u2_ref_clk, "usb2-u2-ref", usb01_ref_parents, 0x1348, 24, 3, 0);
> +static SUNXI_CCU_MUX_DATA_WITH_GATE(usb2_u2_ref_clk, "usb2-u2-ref", usb01_ref_parents,
> +                                    0x1348, 24, 3, BIT(31), 0);
> 
> I hit this on my Cubie A7Z with a USB stick on the DWC3 port (the DT
> and the USB2 PHY driver for that port are local, not posted):
> 
> - v6 as posted: 0x02003348 stays 0 and the DWC3 soft reset times out
>    (-110), 4/4 boots, one of them cold.
> - same kernel, only bit 31 set from U-Boot: the host works, 3/3.
> - with the change above: works, 3/3.
> 
> Same DTB and initramfs in every run. The SerDes gates were also the
> same, so I haven't checked whether they matter on their own.
> 
> My boot chain (U-Boot SPL, TF-A, U-Boot) leaves bit 31 clear. I don't
> know what the vendor one does.
> 
> Thanks,
> Vinicius


