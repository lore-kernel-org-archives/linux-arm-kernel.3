Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B5DCD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 May 2026 21:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7RqPKh7sZHF+28JeEz6CG7pr0J0NFZKqUhuzHW8CkS4=; b=MaGhHd+aGE7bzRDCyIqfociaXW
	JWrhHjNZLG8r/2izD13f1HEpWDggtQJMJhMx0G33knJ2U82LF3qwTrMOldCaXGSby6Q1eD8WGxSgR
	CUn2EHMeaFFATGDVolvnqZ34G6mXJbaS/tn/fyMD5J8aJ/LmNnDnoAiDewaOB1BfRrWFk30bUdX/+
	hy2ph6pTMW+IRuj+LjBsZ19MtPNazYexyK6Qqo4xTY7by1VPMuYIL+aHRglYQ/Fk5Q2ioNmj1n5Bo
	fz+YWHpzfRQQj2RDNYWki8zkgpaeiJKk1ngal0L2649vh7BtI/h2mALMw9JzBzS44eTSglXS1OeTs
	zcrKmNwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJHiZ-00000009iTK-2AfB;
	Sat, 02 May 2026 21:17:43 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJHiX-00000009iSJ-0b0J
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 May 2026 21:17:42 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g7LMr6WTvz9tFH;
	Sat,  2 May 2026 23:17:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777756648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7RqPKh7sZHF+28JeEz6CG7pr0J0NFZKqUhuzHW8CkS4=;
	b=LCK7vt8ywGFsDdethYein7AVOvM26O4jQ9Sj3DG5Xxm30lSzd6GGRhCm4zndiMUjtJzpgG
	TW2jcM9fV0MxczPq4R400BQkm7zzIZharv3QvcfJrQ9R9qR70pymuDUGFVDGo2W7aF6BSe
	jgQNpRpZOJPyzmtfJqdK2rEfFnA1BC8iXcy5vv6uYNYoCW3k7snTwkShxwZux5gEVd6ArP
	BBVMt09eySjv4oNKWeX9E+3sUhNHhpnzxlZLDAyCI8W7Pk5k5AN/v0qMi+bML9iObdk6+B
	K1ObvvGcSLG+5SIFWwGg+Y3kfTGvTSUQ08eypdez+00C56a6acb39N1HDNnueg==
Message-ID: <71b24195-2a3c-46a4-8587-f5055a015eb8@mailbox.org>
Date: Sat, 2 May 2026 23:17:22 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] dt-bindings: display: renesas,du: Document Renesas
 R-Car R8A779MD M3Le
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
 <20260419193718.133174-2-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUzRoELGedrM3ELUjZr-N6DnF4TXtdQR_k74Xmfppu9fA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdUzRoELGedrM3ELUjZr-N6DnF4TXtdQR_k74Xmfppu9fA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 39hpsyab6hn1upgtg1dgny8ski4mntmu
X-MBO-RS-ID: 22ba611169e36e18812
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_141741_341644_192D33F3 
X-CRM114-Status: GOOD (  12.28  )
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

On 4/29/26 11:57 AM, Geert Uytterhoeven wrote:

Hello Geert,

> On Sun, 19 Apr 2026 at 21:37, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
>> Extend the Renesas DU display bindings to support the Renesas R-Car
>> R8A779MD M3Le SoC. This SoC is similar to R-Car R8A77965 M3-N SoC,
>> except the HDMI port@1 is not present.
> 
> "and DU1 is unused." (whatever that may mean...)

Fixed in V2.

>> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
>> @@ -42,6 +42,7 @@ properties:
>>         - renesas,du-r8a779a0 # for R-Car V3U compatible DU
>>         - renesas,du-r8a779g0 # for R-Car V4H compatible DU
>>         - renesas,du-r8a779h0 # for R-Car V4M compatible DU
>> +      - renesas,du-r8a779md # for R-Car M3Le compatible DU
> 
> I am not sure you need a new compatible value: is the DU really
> different than on R-Car M3-N, or does it just lack some wiring? ...
It seems the DU is identical to the M3N one, so I will add another entry 
to R8A77965 DU to handle the M3Le one, just like R8A774B1 and R8A774E1 
DUs . I hope that is acceptable, and also addresses the feedback on this 
patch ?

I dumped the VSP and FCP versions on M3N and M3Le and compared them, and 
I also wrote and read-back the CMM registers to confirm CMM IPs are all 
present on both M3N and M3Le:

FCP is identical on M3N and M3Le:
fe950000.fcp FCP_VCR=0x106
fe96f000.fcp FCP_VCR=0x106
fe9af000.fcp FCP_VCR=0x106
fea27000.fcp FCP_VCR=0x106
fea2f000.fcp FCP_VCR=0x106

VSP is identical on M3N and M3Le:
fe960000.vsp IP_VERSION=0x01011504
fe9a0000.vsp IP_VERSION=0x01011404
fea20000.vsp IP_VERSION=0x01011904
fea28000.vsp IP_VERSION=0x01011704

CMMs are present on M3N and M3Le, tested with write of bits 28 and 24 
into CM2_CLU_CTRL and then readback:
fea40000.cmm CM2_CLU_CTRL readback 0x11000000
fea50000.cmm CM2_CLU_CTRL readback 0x11000000
fea70000.cmm CM2_CLU_CTRL readback 0x11000000

And it does indeed look like we do have DOTCLKIN1 .

