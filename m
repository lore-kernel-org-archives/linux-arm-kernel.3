Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171A4C55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 11:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQ8FA2fWTWW3ychqhFt4dxOngt5CRROg/bBvmNFIN9g=; b=bylnAHmOyg+Gtyexx394gfGSEZ
	JUxceqHcRsJCa+0l52dimUJf7o+pqbDMox7KnMZPryGQvV4xggtjcBBFVHEjNsI4iONR7uut95OLZ
	c4LPuJbRrDsf+j/q2yUx9j4CKdot2eRC/KFu/oomA5vux5iTkfMH5AwSOYKUpW9alaU2WmuGlP2Ns
	6gbASYNDhmkFGD3YF4kdRZNZzAsilHCpfGZf2GPDebaWw5DhXkFWaew3rcNn/F40fTqKPrKWTbtm0
	KU9LHHqsXpuT7K2kTK9OhE9hVXyJ5MocIM6KfYoE4IndbVgkz2lXOscVcIUi9Dx7Wl4sbj8tF88c/
	uxy1ENVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqUS1-0000000Fa8Q-0sm0;
	Sun, 02 Aug 2026 11:33:53 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqURy-0000000Fa7T-10fW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 11:33:51 +0000
Received: by chaosmail.tech (Postfix) id 883B41C7DFC;
	Sun, 02 Aug 2026 11:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785670426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qQ8FA2fWTWW3ychqhFt4dxOngt5CRROg/bBvmNFIN9g=;
	b=JagXz8IhkCCObi807f8UbOSh5vSP51UyR0EcFBXSFJjGZN33j8LTDk6yPiBCugJP6uUFcX
	zG+UhtZaxwANGakNhuVQyL4mVcgI2vQcvg/Mz+axK+C14rK9aKZ+l+X9WrRRZlAfDjaKjF
	X0NFjRdbLWt9uU5YaZkXLoJhoxE0Akw=
Content-Type: text/plain;
	charset=us-ascii
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/7] spmi: apple: Implement remaining commands
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20260802111853.GF806854@robin.jannau.net>
Date: Sun, 2 Aug 2026 13:33:34 +0200
Cc: Sven Peter <sven@kernel.org>,
 Neal Gompa <neal@gompa.dev>,
 Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Alba Mendez <me@alba.sh>
Content-Transfer-Encoding: 7bit
Message-Id: <78A4FB29-7BD0-4AD3-973B-F73012F6671F@chaosmail.tech>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
 <20260728-t603x-spmi-v2-4-f43e5f10e583@chaosmail.tech>
 <20260802111853.GF806854@robin.jannau.net>
To: Janne Grunau <j@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_043350_751746_5B0D6F9D 
X-CRM114-Status: GOOD (  10.28  )
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

On Aug 2, 2026, at 13:18, Janne Grunau <j@jannau.net> wrote:
[...]

>> if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
>> dev_warn(&ctrl->dev, "FIFO has extra data\n");
>> 
>> - if ((~reply >> SPMI_REPLY_FRAME_PARITY_OFFSET) & ((1 << len) - 1)) {
>> + if (!ilen && !(reply & SPMI_REPLY_ACK)) {
>> + dev_err(&ctrl->dev, "command not acknowledged\n");
>> + return -EIO;
>> + }
>> + if ((~reply >> SPMI_REPLY_FRAME_PARITY_OFFSET) & ((1 << ilen) - 1)) {
> 
> Is the parity check useful for write commands? I'm not sure if packing
> all command processing into a single function is a good idea for code
> readability. The diff is annoying to read.

Not useful, but on the contrary I like that every command is sent via
a unified path, instead of using similar, but slightly different
functions



