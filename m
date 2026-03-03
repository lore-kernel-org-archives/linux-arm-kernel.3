Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081B4EC1458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 14:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8j6AI21MZvaeimRNQiVXBgb+npF++NlMmLHZtlK5Se0=; b=FAMS/z/kvlAsgI+SBDauir3M93
	+cvQKS0bN7ZZwlLqH1btPkYmslPobnCDeFKInYQ//P9sr2k05RGOQ00kHYHpnAbznGcBg02NuGkbp
	Pe8Nun0oCXuZd3T36dpGp97I7OLCIkNN8Bq/FfkD4+0Sp0aMlZTX+5yepdT2JdTUp3GrC+kMdJVtA
	4fedzOkM79Y1T36nU8wXXGb/6bszHgMQIpYClDW9JS9TvsA3OVhTZCyRizpbQo4kRTVFuhO5YVewF
	flIvj7IoA7wFjAKiF3A7vJDiL5Sw0ciuZ9Dj9yR1XMOaldQ4mkKykur23l3rBx/y8PzcoAkFDGjEa
	4p5e3nVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQUc-0000000FIR0-0OpM;
	Tue, 03 Mar 2026 14:12:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQUZ-0000000FIQY-0Wd6;
	Tue, 03 Mar 2026 14:12:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772547173;
	bh=I1RcmXzbZMBrvUOvOt+mIG2zd3hNEJtpd9z3pYneLCU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UDHVu/Fjr+fk4c6bX+qQg8zJqvbVYEATwZlstMqA7VCjpgNMmGNSxYMwxR37rbM5l
	 bmvb63r9bm9DeTE/SgNX2YvHp8Bny07/E4cHgbw1Z2vVu6ryVTO0DLxkUmYsDmmylU
	 saCIuMIloFvRm3Etr/9RjSq9dDKD1dvd/dFvZ+r6+cP8KA7EaNjoyz6EdloDgN1NzK
	 +5TcPMzkII2plQxzUUdfPJycQuxQwrFTKP+zlD2MntzudUaOFZcR96FceLq2ZBMEBt
	 luNDUcnQO2iQVrJVXta2BM3XfKfjWsiWYeIK1rEWemZxQcvEkEm0hgf69qu80kwjks
	 7+084pw1iPJ0A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DC2F617E03E5;
	Tue,  3 Mar 2026 15:12:52 +0100 (CET)
Message-ID: <f5290ec5-2c54-41cd-b926-44964499fb7b@collabora.com>
Date: Tue, 3 Mar 2026 15:12:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: mediatek: audsys: fix formatting issues
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Eugen Hristev <eugen.hristev@linaro.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260303-mtk-audsys-dtbinding-check-warnings-v1-1-e4e1b62f060e@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260303-mtk-audsys-dtbinding-check-warnings-v1-1-e4e1b62f060e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_061255_321043_6DA74DBC 
X-CRM114-Status: UNSURE (   6.33  )
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

Il 03/03/26 12:58, Louis-Alexis Eyraud ha scritto:
> Fix indentation and drop duplicate newline to resolve the following
> 'make dt_binding_check' warnings:
> ```
> ./Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:52:2:
>    [warning] wrong indentation: expected 2 but found 1 (indentation)
> ./Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:84:1:
>    [warning] too many blank lines (2 > 1) (empty-lines)
> ```
> 
> Fixes: a8e3d66ff5c0 ("dt-bindings: arm: mediatek: audsys: Support mt8192-audsys variant")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



