Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FCEEB48F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 09:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GeIzQNHktktey8OIUpOTSIbvRhrXukd6Tv8SkGdUD7E=; b=tCugCN4Jc0LWFWDQfQh08BgPAv
	qiR79Ro6L94GeviIY7Rua/wosG1F6T2wN/kxSLJxJQge19H9XL/W7jzfQ9Xjjfcz3N3ApEVZA4LyK
	J/0PoZE3RNfZq/CesSpdZGy21a0rdQBEc3IrNNhLHrwa7vF0HX2JQmYbckAB1zihxoyA3bKon8tMt
	0W0Maj4GMRjPRgNZ6gxiCI9VthabBhjUeH9PkMh3qZKfr721HKWjZm2E0I1x2TA+KIKJykOFFFSpd
	/fweQsNBW6LBpNsK1qf5cGyDmLDCYKd3hM8TuU0jZIrsFoaFQSfA9Ba7ZZxCz6oOQ0pxr8meMAMgS
	DB/3U8BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTNI-00000001rY4-0n65;
	Thu, 12 Feb 2026 09:52:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqTNF-00000001rVZ-2CPU;
	Thu, 12 Feb 2026 09:52:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770889953;
	bh=ZJO2M53nFm+7JNZYH4Ke5ZPuzhwbrJ1wCVlgTaFyThE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mCX3NnfOb/urR0DSg9JK0PA6HkIVPkKs0IrUqxWke0uoA4Lv6sh5JthDxhc96rfaC
	 HHrXGNHb3E+PRjB+gPLX3yNgM6sHm2GALWy3ykCBnLHspOAF3mef9RuLeiM1CrcDWM
	 cnFVMxKTkV96I+kS+mU0eauJfUluZ7ozuxJLfsM7HWL+ZEWPiDlfOGMSZOVXKTS7Qp
	 P2k3UF8BoaqhJfGW36glmMiHKk6hzFpwbIgOJbFpur50QnrCh7GRTe86itiDADIbXq
	 Nya+CPDn6nKUMcw4ZA9ZG0TBKKt7yKZtX0Pqteu+0uE6UFLjO+FC5iKos9kU0O+Cv2
	 BNQnCRS96gFrw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 37B8117E1428;
	Thu, 12 Feb 2026 10:52:33 +0100 (CET)
Message-ID: <9e4968fb-8a04-4ac5-bb48-016cdb834af1@collabora.com>
Date: Thu, 12 Feb 2026 10:52:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] dt-bindings: watchdog: Support MediaTek MT8167 wdt
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1770836189.git.l.scorcia@gmail.com>
 <560b1985c911ce25950c9caedc42677ae01fa8bb.1770836190.git.l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <560b1985c911ce25950c9caedc42677ae01fa8bb.1770836190.git.l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_015237_762543_238103DF 
X-CRM114-Status: UNSURE (   6.41  )
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

Il 11/02/26 20:03, Luca Leonardo Scorcia ha scritto:
> Modify dt-binding to add support for mt8167 dts node of wdt
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Please put the binding patch before the driver patch (you anyway have to
send a v2, so ...)

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


