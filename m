Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E355D6B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 16:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5sv6Osm+hNdG0v4tH6pLb4nmhsoVJGlvY2TU4U5Ma4=; b=DiU7UNwcQ3/NxJY0d+QRdJX4jV
	mbxBmJo4YIskc8o7rNHbv1zRu4C1//Ri7+dOYwGkZSqvQoCKUJ+qSmd63LM9F/Zaa6zAogHAwsqU3
	463nkpn1ZSCKak6ZuRykhhoIvp4NqNZDs9TtBaoi3DYhJSyCqbLuiy2zIKDq/fbKOpHzRqDyQ637k
	54d9xWFUlD5NnsO8E93PYq6OLt/ibq9ZPBIY3Rn16Esy139j5W7DpVbmzftDwrMiZy1dbLOrlYQp8
	gBNBWX9WEcdjQt6kW+sruGoDeguwHCoDUQOI/KRKT7fR6BGdenuvmWZSpMnZANMfCtqlJsixeXnCv
	enlFZ9RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUYg-00000000Jv0-1JYf;
	Thu, 29 Jan 2026 16:07:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlUYd-00000000Ju7-3vmB;
	Thu, 29 Jan 2026 16:07:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 755164352E;
	Thu, 29 Jan 2026 16:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC0FC116D0;
	Thu, 29 Jan 2026 16:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769702864;
	bh=edyDpWccp+SyzVe8nIG32V3ZrXLEdt5h0WZKlrcY6v8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sCdN8CbR5l8R4WunQ7GAUxr3QMfkZwzToa26q1AFrGW7T76dNbIP3ei9J7Jk0i0jX
	 /7CvviOfsV7Y5E8j+WTFE/pfHpIp8Zn0HLi57nliQwgxTxYDZK2hYcf+poBntKM56R
	 dmTLBmGNNK80aA6AJdW+iTYFqnnA3s4kCEA3BnRFwVik5mN5yOxJ3PIdDK8WFd+6u6
	 eNbZpzPwEI4tvpDeoLgZM9J/5QonjCfbBICBqz15g9LPR6t4b4PfQOKcJ0HNbhSyW7
	 v4pS7V37P1NmH1q/8AsoJJ52KxoXidUECYyMBZghYuo8756OsSFMsVvXB9HX2ItOD7
	 WdtBrRo/E8r3g==
Date: Thu, 29 Jan 2026 10:07:43 -0600
From: Rob Herring <robh@kernel.org>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com
Subject: Re: [PATCH v6 2/5] dt-bindings: Asoc: axg-audio: Add S4 audio tocodec
Message-ID: <20260129160743.GA1117034-robh@kernel.org>
References: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
 <20260126-audio_drvier-v6-2-99e350855bc2@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126-audio_drvier-v6-2-99e350855bc2@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_080747_991099_31925EB6 
X-CRM114-Status: UNSURE (   8.65  )
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

On Mon, Jan 26, 2026 at 06:01:43AM +0000, Jiebing Chen wrote:
> Add S4 SoC tocodec compatibility support.
> 
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
> ---
>  Documentation/devicetree/bindings/sound/amlogic,g12a-toacodec.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

