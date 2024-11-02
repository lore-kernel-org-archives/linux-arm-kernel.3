Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA5DE67814
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 21:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jNMhXcJKcBpvnGjJMzZIXegym0DknS3iJCDKlLNRIs=; b=OINrvDAlErW6+OEY3S/2RmxkyX
	Dtgm76kqU3b2oEpCHB8w9xwdA86lbbiIQnL7TZtpyMYTwyGXXQ8PzyzZwXRhVXQ6WcFsa3Bj7SmS6
	2MgrN0pj3r0JtwHs2xG7gVFAMTt3m03vvd0ZwWTxPVUBAjhIcRWprhU3zdBbuXwDYBMZzTsgFPRgy
	8PkCdJVr9cLrNu7lwjfqBkHRXGJlY3d0Xo1QDOoxcx34780oBgQH7MdNNwJ29IfO42MDZ24HNs+US
	GBwVFkxrDhx+TGJ/WBGQX3UfD1+oE2rrjdvu7mtgmtv352T9ixmB7B3zRuP8nAi0kkKxy/6EsaClx
	RYI7OzIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Lc9-0000000AR8F-2DyI;
	Sat, 02 Nov 2024 21:24:57 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7LaS-0000000AQw0-3g8B
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 21:23:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1730582588;
	bh=lUBRlvZtflMuXODUVE4C23FpmQTp14LkJVoNNlP2kEs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IFK0A0M8uMH8FIsQ7JHYXZMporgKO9E2ULkzM5d1HxOtzs/FyfYe2e9Gk8kKAXLvQ
	 v8MXYw9QvKecZbRnnL6BdpOurT2JMmzI8DLXKszz+aXDHvQLPFKLx6cvZwI43cdIn1
	 1gLrLe7t4WzlU1zvrSZjtIRAh20gbGiTBwTZ5r6V7PgQSagB2N1fqEmMkXezkyvxmD
	 rs7PbTSku4KIxw+8Ml2lxdkErmDLYLXU3qVuIxNZQgBLiWfVL8QYcGTjXwd9TouEu4
	 iI+ycEjpUPqnENhtiyvcFXI4SS7iH8jDF3gOV2Vo5YO+N39789ME28z++l3Q3COZLu
	 ggZ8BycJUBnVQ==
X-Virus-Scanned: by epochal.quest
MIME-Version: 1.0
Date: Sat, 02 Nov 2024 18:23:05 -0300
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: wens@csie.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Maxime Ripard <mripard@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Yangtao Li <tiny.windzz@gmail.com>, Parthiban
 <parthiban@linumiz.com>, Andre Przywara <andre.przywara@arm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/13] arm64: dts: allwinner: a100: perf1: Add eMMC and
 MMC node
In-Reply-To: <CAGb2v66TAttAezXE7TnT5N6XFW2482ipuqkcpwjeDud6v=xD3w@mail.gmail.com>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
 <20241031070232.1793078-11-masterr3c0rd@epochal.quest>
 <CAGb2v66TAttAezXE7TnT5N6XFW2482ipuqkcpwjeDud6v=xD3w@mail.gmail.com>
Message-ID: <36415ea50a5aa6cec8c5fb281af73f50@epochal.quest>
X-Sender: masterr3c0rd@epochal.quest
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_142313_010119_081C8E77 
X-CRM114-Status: GOOD (  11.30  )
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

On 2024/11/02 8:48 am, Chen-Yu Tsai wrote:
> On Thu, Oct 31, 2024 at 3:03 PM Cody Eksal <masterr3c0rd@epochal.quest> wrote:
>>
>> From: Yangtao Li <frank@allwinnertech.com>
>>
>> A100 perf1 hava MicroSD slot and on-board eMMC module, add support for them.
>>
>> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
>> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> 
> So I skipped this one since Andre had some questions about the previous
> mmc clock patch. And I believe this one won't work without it?
eMMC (mmc2) works fine after more testing, even without the clock
reparenting patch (in fact, it appears to work more consistently), but
mmc0 and mmc1 require more testing and debugging. I'll deal with
the remaining MMC issues in a future patch.

- Cody

> ChenYu
> 
>> ---
>>  .../allwinner/sun50i-a100-allwinner-perf1.dts    | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)

