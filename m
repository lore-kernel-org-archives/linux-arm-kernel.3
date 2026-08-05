Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DAFC55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 16:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4wdnIB7yu8IgdNvMRTaaDTfvRZ6N+3RnRfrYjaJiDE=; b=YsgVWBHm46eDke2lbpDbRzmDPh
	W/o8Gh5vpMWxEcs6iqw0/IOpl28I9QSumxr2ZS5REWqCuzt/OS3cU/1p7vCV9xsyMLOz0f9ab0ePP
	SDatUGdkwvBSsCz3TPlbAZFBx+eKRaoUwetSjgEAy/UgEM3Rf7rgWa2ejhFa4wOJyadKkdNzWO52e
	A8Amho+xLfVHs2bXicuB7Blh3uX+v9vheOX1ihOnzHsZoXnI4s35rJZzWBo6+1FVC4ngdBLoMYrz/
	uDblaLCqa9ZOSX2FuBSLK2XDZpUGuVT6ryeVuo8Su247r0holoM0mN4oMI9F6OavVEN8PqPC5KkDu
	JdHP0DLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wret6-00000004Ie0-3hjS;
	Wed, 05 Aug 2026 16:54:40 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wret2-00000004Ict-1ztF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 16:54:40 +0000
Received: by chaosmail.tech (Postfix) id 165641C8156;
	Wed, 05 Aug 2026 16:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785948872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i4wdnIB7yu8IgdNvMRTaaDTfvRZ6N+3RnRfrYjaJiDE=;
	b=Q06ks7hUmJV4IInkKO9zbb+/nkToSLWu+DxBFOgN80f92c/retducvabO14uvMIEx9m2K7
	2d7PwpZfIpvYefG/CBMsceKQvajBIf852sTmF+uNgzByujZhJk+OFKF8I+5YYlB9YFCb67
	W/sFtyVGlC82drTh25tjfzyQxVNJGQk=
Content-Type: text/plain;
	charset=us-ascii
MIME-Version: 1.0
Subject: Re: [PATCH v4 4/6] spmi: apple: Implement remaining commands
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20260805121956.GD832571@robin.jannau.net>
Date: Wed, 5 Aug 2026 18:54:21 +0200
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
Message-Id: <735B8A2E-7E9B-40EC-9BAD-FE14232AAE6B@chaosmail.tech>
References: <20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech>
 <20260805-t603x-spmi-v4-4-c15a12d9a7d1@chaosmail.tech>
 <20260805121956.GD832571@robin.jannau.net>
To: Janne Grunau <j@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_095436_981424_4669AE33 
X-CRM114-Status: UNSURE (   9.28  )
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

On Aug 5, 2026, at 14:19, Janne Grunau <j@jannau.net> wrote:
>> 
>> -static int spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>> -  u16 saddr, u8 *buf, size_t len)
>> +static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>> +  u16 param, const u8 *buf, size_t len, u8 *ibuf, size_t ilen)
> 
> Instead of two sets of not very distinctive variable names ("buf"/"len",
> "ibuf"/ilen") please use just buf/len and a boolean to indicate whether
> the command is a read or write if you insists of routing all commands
> through a single function. This can be simply added as first condition
> in the "while" iterating over the write/read buffers.

Tried it, ended up not working, as the buffers differ in constness




