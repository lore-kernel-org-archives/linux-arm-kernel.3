Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65912E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 08:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbHybnIOXmlSwaXNoaXYOUqH0/mYuZ8kkjuKjW87omQ=; b=JF0YT0wooBcCDsKcU+W+3azA2f
	XToOkQ6n8r0Dwv5pTezGh+JjwdmuEZGiYzfLD8dk8r652LnUuKEh772BbMQdumuQ1SlYqEEtVPr8C
	rjUIDlLOU5GOcbacKuBDlk3aGR3vqn5wBPweoNZWWqeHdOjm+6I5aZqrdY6Zg4ZaylOXm74sJMBQs
	hlE8J/6m4/AZ3hA33hICQwGV5nKUMNKFZRONW5HnAlE9enLrWx9rUo+Lvw/C1R+7GpDuhFuRQlM49
	7gvYhD/MwGdyb4h+5xNtmO8fJUkMW8LIDAqXyRXbIk1WQY6uF4mKYQYJzGABaAzRKvQOHcKjTVHo7
	b7bn33mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR5zh-0000000HPdm-1fuG;
	Fri, 27 Dec 2024 08:46:53 +0000
Received: from omta34.uswest2.a.cloudfilter.net ([35.89.44.33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR5yS-0000000HPSa-0nDp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 08:45:38 +0000
Received: from eig-obgw-5004a.ext.cloudfilter.net ([10.0.29.221])
	by cmsmtp with ESMTPS
	id R4KKtTex909RnR5yAtq9xO; Fri, 27 Dec 2024 08:45:18 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R5y5t5nGQWvXpR5y6t8gAR; Fri, 27 Dec 2024 08:45:15 +0000
X-Authority-Analysis: v=2.4 cv=LtdZyWdc c=1 sm=1 tr=0 ts=676e691b
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=NEAV23lmAAAA:8
 a=oIXfh7CG2JD6673A1wUA:9 a=QEXdDO2ut3YA:10 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CbHybnIOXmlSwaXNoaXYOUqH0/mYuZ8kkjuKjW87omQ=; b=NDNJRDDnw/y2q/XpMHCG2FL1sK
	oITjouXaGaiFTHEqjQ1JABwZmQ0zzYnzoflffHMbU1Pjkj15KTHaR7OyQNyL4t7Ldkku8gntKicsO
	nFBwg3skiPmnF+9QeKVeYfiIZjA+tjRroZ/t8+gAlEqXfTdHol7mNAYzGekP6uIRKCy7HdIfVFqgg
	nnm+VYrMucoVSeE+0O388Pz3oumqegJkOKSsrN/SP8rkh7MgdPwt86JlP2uH5MgmOvAAYhmVWmWEZ
	0y7OPy/Uj+4Z58HzetcOlpOv9tfweAhraj0p/KWJkKCX5dSIAHFhLZYOLEn0CGAUaoJdk1pbK5LvK
	zh0wxk8Q==;
Received: from [122.165.245.213] (port=48506 helo=[192.168.1.5])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR5xx-003AmV-0N;
	Fri, 27 Dec 2024 14:15:05 +0530
Message-ID: <9415ca9c-f303-4507-8cd6-cb08ee09e988@linumiz.com>
Date: Fri, 27 Dec 2024 14:14:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: a100: enable MMC clock reparenting
To: Chen-Yu Tsai <wens@csie.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Yangtao Li <frank@allwinnertech.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Cody Eksal <masterr3c0rd@epochal.quest>
References: <20241109003739.3440904-1-masterr3c0rd@epochal.quest>
 <173124139852.3585539.10704015898700065278.b4-ty@csie.org>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <173124139852.3585539.10704015898700065278.b4-ty@csie.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tR5xx-003AmV-0N
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:48506
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 5
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIDz5ZAylz7yHkbfP4l13k40d52lbxiI83Tolmh0oLggS8EYhwUPnccfnbnjYD0FKE5vgSXuILMGGyLFYMgrVG4qVj9Zp8KoIRr+smH9Sq9s6pF7S/dL
 ikDsMb/zVeie+XU2bxF43HuWthnLNZvV8hcq1LsNEC9BKTQ77zdi2VtsNnuS/+2Hwe76XOOqQlRSt+tUVX6DDQAoXrIWkP6F8mmgN4+7GXsIZseACKFd9RgL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_004536_745274_4774C9A3 
X-CRM114-Status: UNSURE (   8.00  )
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

On 11/10/24 5:53 PM, Chen-Yu Tsai wrote:
> On Fri, 08 Nov 2024 20:37:37 -0400, Cody Eksal wrote:
>> While testing the MMC nodes proposed in [1], it was noted that mmc0/1
>> would fail to initialize, with "mmc: fatal err update clk timeout" in
>> the kernel logs. A closer look at the clock definitions showed that the MMC
>> MPs had the "CLK_SET_RATE_NO_REPARENT" flag set. No reason was given for
>> adding this flag in the first place, and its original purpose is unknown,
>> but it doesn't seem to make sense and results in severe limitations to MMC
>> speeds. Thus, remove this flag from the 3 MMC MPs.
>>
>> [...]
> 
> Applied to clk-for-6.13 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!
> 
> [1/1] clk: sunxi-ng: a100: enable MMC clock reparenting
>       commit: 3fd8177f0015c32fdb0af0feab0bcf344aa74832
This commit is missing in 6.13-rc4. Will it be merged in the next rcX?

Thanks,
Parthiban
> 
> Best regards,


