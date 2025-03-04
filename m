Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A28C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 14:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GY3r7CJQBLU0+p+5wiwGL8QESm0o9ed0D65vO+ZpmWI=; b=1V3wolq5ZpzEyA0mEs5E9lxdl7
	xNPcvUBKZfRMfaLmjPnQFkhbLQP0ygA3ot1gZ8a93agCgHXTiCvnADJIjEE4ARwOzFd/v8cnQLHLc
	e4ya8FEQGHZW545QSXCHWjZIzbRPajhpyz6KTqsTKfJ4tCGtDKIoAbTKxVe2WiSVh9/5JSaX/rwnh
	0oq/VuzodOx+nRZH0uYgSrAYNmbMwBhx21FvAW52wFYIRAi8miapGnP9bAcmSMv7wEcVpoWjYOKLb
	uEpFISSvFS9dfO/TKfAWdb89NGce/ajh888xLPCQ/p3fG/wE2pzLpBCjHLOEeSBHOCbjpmnXEQSzp
	wLkB/Q/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSzi-00000004viY-2046;
	Tue, 04 Mar 2025 14:11:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSvm-00000004uax-3KKQ;
	Tue, 04 Mar 2025 14:07:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741097253;
	bh=H2V9OGuEsacGbkebJ+L8iqFHNFhIyiawTQ3qvmC+JxU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TgHe7cWF4ZowDICncSBL7gZhxAw7+I2E0Vc4SZuP4JAhGtmfRVGJVcvYVcniBfM/p
	 eNB4x3Wg2TgJMpuRkokRMOtMeXiOLcaA8GYCZBUGFFkcz28DPxCZDcmayZs5TyQDOH
	 79gIvUVmRG3Te0i4IpcQfbH6COFYkCkJSuL9yRkvrq8umuICc0YzLrZfUqe/OnPybK
	 PysDUYk56qvzUwD/1q0qVBwBlRi1fpFLYQPE0zh3wVlsa0Amc5mMiFvxHiLbe8/KXM
	 GqEaw0HyxQV+Uq9J+Cw6KaqNR9uCkxixpoCJnC2Ui2v84l8KI5RvS2JfXZfkV1zT9n
	 Z9Bw2YAeaoubw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A02C517E0FD1;
	Tue,  4 Mar 2025 15:07:32 +0100 (CET)
Message-ID: <c2580ca2-2999-43cd-a1bd-ab660bbc8953@collabora.com>
Date: Tue, 4 Mar 2025 15:07:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: mediatek: mt8395-nio-12l: Prepare MIPI
 DSI port
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250304-radxa-panel-overlay-v2-0-3ee6797d3f86@collabora.com>
 <20250304-radxa-panel-overlay-v2-1-3ee6797d3f86@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250304-radxa-panel-overlay-v2-1-3ee6797d3f86@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_060734_977403_6945EC61 
X-CRM114-Status: UNSURE (   8.08  )
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

Il 04/03/25 15:01, Julien Massot ha scritto:
> This board can use a MIPI-DSI panel on the DSI0 connector: in
> preparation for adding an overlay for the Radxa Display 8HD,
> add the backlight, and some definitions for pins available
> through the DSI0 port.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



