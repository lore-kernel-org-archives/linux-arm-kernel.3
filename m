Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D71CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 09:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I8m6beCvxnJPquCD7h0XJsUUqveX57WbhrGe2a0Cw3I=; b=ZRwNHf8jjzutTgNiw9yB69SRh5
	XvLWqpRkfrwjNWAU6nSIaI59ELCFYd05ZtY8w8YpS76HqeU4s9mHj9wqqFQrp++gs/0kuyTsSaHLw
	dVjvYJWTlnnoR28A8jnkbm8J0MuVAX9IV9D6xT5bjzMCvRvQHCurLqy4rUTKibNVHVvI1v+RaJk9Q
	Q81SxTjlNs6fUQzfqi6+ohn6zB73AKNtTzESONDJ3mdChG9q4yzDffMF5uMS8IOH5AABhfCofjmJj
	/oCJRCRwK/KvZxBCHxSAfaPuOc3hB7MHOesusPRkJmJXS+j6IeX+p1Fk0GqeDryQb74WqMfPlMqU/
	O5nacWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8F4d-0000000CmFy-3tT1;
	Mon, 13 Oct 2025 09:42:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8F4b-0000000CmEw-0grm;
	Mon, 13 Oct 2025 09:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760348550;
	bh=214Dajmg0oakMhmrau+WfKp7HaFOxspiih+ll6xoZrc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nKvUsihUlsIWIIjyXxJAOXoWsrzMF35QZuvwR07iQeSv69v52O6YB52TbWKkw2ZXt
	 Ov4R5KZZZsKu45giPfjxhV22BWSHIApNOaC/oLTf45HPbGzwHYbW75NYgW07vqsdR/
	 SYGWI0ikLX5dRgOGSccZFdqC7D6eoun2daBExvc0UtwonRcWITN2DNJGRQC+oGOazV
	 Vs4AM+uvVyWIkkbWfZJjXLAxmXYVq3fyPsmTflP/R6PmtQO9KdiY+7zvgFt0S7gmbm
	 dLO4TDou+ddabf5pn740qYlkdfItQrmcDGWXYxXJHdaOT1TUWvWStumBfOfNavm2Al
	 QALo5F5dkMKnw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1BE1017E0523;
	Mon, 13 Oct 2025 11:42:29 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Frank Wunderlich <frank-w@public-files.de>
In-Reply-To: <20250930021656.1394942-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250930021656.1394942-1-mikhail.kshevetskiy@iopsys.eu>
Subject: Re: [PATCH RESEND v4] arm64: dts: mediatek: mt7986-bpi-r3: Change
 fan PWM value for mid speed
Message-Id: <176034854901.22371.15796783278122302723.b4-ty@collabora.com>
Date: Mon, 13 Oct 2025 11:42:29 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_024233_388738_88192158 
X-CRM114-Status: UNSURE (   6.36  )
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

On Tue, 30 Sep 2025 05:16:56 +0300, Mikhail Kshevetskiy wrote:
> Popular cheap PWM fans for this machine, like the ones coming in
> heatsink+fan combos will not work properly at the currently defined
> medium speed. Trying different pwm setting using a command
> 
>   echo $value > /sys/devices/platform/pwm-fan/hwmon/hwmon1/pwm1
> 
> I found:
> 
> [...]

Applied to v6.18-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt7986-bpi-r3: Change fan PWM value for mid speed
      commit: 8365a3e1fdc3e9a69114165877e0ca281ffdc8de

Cheers,
Angelo



