Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55B2C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 23:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D9SSAA5SUZ0CJogIz5q0cDzB1Ecy5N6mhChS1/7HJEM=; b=gekeqeSEJYFfQ9f5fasdbKzNCO
	q/nScg+OdEtHr20aCYT6IldLz1qqtelwan7G7nCM+PMHdTZokDTpQ7XXIiJvgSi+RwO3rRrXve/gH
	CztQ9jtM2xBUo7l4AX7lrTidqsvUoXpQ4yNIZmQJtrQEJ98mWKs7THJgmiJyXwaaw3q+x++R4KoOZ
	bPK2QWoVCMWJdjKn38i0gchJ7OksiQl1MSAS1vl1dMKBRV+NObFqEoDrncu1SzQ5Xma6lJlliTue0
	bX4OkmuSbr0vrlL2UYqPzTo7YySTXDVBhzyb4wnu0UFYVqRIStqydAIIWF5xNnH1VnoAZhmNLpZ0n
	jdQZ3d4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnnm8-00000009DjW-01Sp;
	Thu, 27 Feb 2025 23:58:44 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnnkU-00000009DYn-0Wng;
	Thu, 27 Feb 2025 23:57:07 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7273b01fe35so888824a34.2;
        Thu, 27 Feb 2025 15:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740700620; x=1741305420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D9SSAA5SUZ0CJogIz5q0cDzB1Ecy5N6mhChS1/7HJEM=;
        b=HIBke2HS0Egk8cUmA7wZD25ofY68JU5MUfUMqWPJQTLIlEwZMQBTVcBbZVMKiSDVnA
         FUkMdFlI0LJMd1iPK0eZh0sygNyK1F2Yrd7jYeqLxVbcQqRyIBJcMj7gMsP00kqs7zVi
         OSGEU5Ymw2M+iaCt7R85LNA0D/33cyEJmGBusamLf17N6h58q+c2IzC/jSo9MAQ1SIje
         1noMDQ4CwzoidcVUCl1bOGZ0QeAUOvU+LCwpBpNsZV2cTOVh9fZaQzUDapoYWs3FnxfK
         +dRg/WKmB/7bFsuEur7OsvKQRH9iZyS3uQEyx440sC5mcoThQ8iFcfKjpZ8AS4UGlsL8
         L4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740700620; x=1741305420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D9SSAA5SUZ0CJogIz5q0cDzB1Ecy5N6mhChS1/7HJEM=;
        b=Zt/vNt+mYm4Kj34N/HxBh+ZH8Zjhd+DxjG+ZkLBbcZM/D1DJilRjabO04XYxdxqyrS
         y5sjIow+SCcE+Wx2s4vGrKXo/fxZSTxlFCVKbibgwhffOER2bHFjPtlRBp5mh+BHiqhf
         f+QLOGl6bVj7kbYnOZsA36c/Ei4Y//D86c6NAgPz+WrT/a5Hy7Bh/cm1EkqwZnUNsBYl
         TtWHNCvhxBca4IUlmNBMRvzallRCn8T59INV9e8kKC0zxFomJYAICsmLF0BpjVkd3qOZ
         lhDqVU/ZPmTtd3hcCktu3wHzL9Kc67KlZfy1dQqW7mPkzVJJP3PjMsF046sxDqb8mN6N
         Vo6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVG5BRigD0Q8d5/ndY1A0TfzhfZWHWoGh9VZg4hZMEvIxSaAY/pjSRzAxgrpaSvxPFvRkdmo2B4iQ3hZH43x/JI@lists.infradead.org, AJvYcCVlmOjyCq3Z5T6S3RgL2XnASF3WTzFqkNuQy3uB+0+XKUOuPKMQ5DX0wa+So0iR8V9mRdfCno5Xs8xQFsTrEks=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6QuWx/v6E7w1U4vjxU5emQvUMkHsvJteVMF4+2odiBKgrzB6O
	QRMVJ/AG/BoOoXk+N5LlYtsueFyoE3SBwA19mN2KvruROX9DpNUm
X-Gm-Gg: ASbGncsg1YlPEBuJNCp/VVgEn0NKiXRyCmtLj8+hQuNPxaZV29DJcwUWqiAi13rY5SK
	EPJFDbbjw31IEj3oMoZEkhsv4HjpKAv7yRMpOImGJjSCVGNq/++ebdvel5dVvepvF3Mjglq66fb
	Q5EE3Dy8L8aRa8/C5BCkw0NfEA184JsxnkSfwy8GkgWXJ2vqR0QAXHBVCS1pRyqH+fPYdAX7vDy
	/AIrFYBqGMoQS4AgT9j8WiMIuvKInJrDChrZPIL0BDGdqXMmiJkjSQvz/lYCTD3QetS4ugpT3w+
	wk9c75Iu26HLzlKQZvMkRAvQL82/Eqy+25k=
X-Google-Smtp-Source: AGHT+IEzxJ3/aDFJMSIXRCVTUCYikYwc7MbgxdmygO8C6wM+9nFe1yFcfZ8GaoUVZ69BjdiyQVU/uw==
X-Received: by 2002:a05:6830:370f:b0:727:42e0:be96 with SMTP id 46e09a7af769-728b82670a9mr820001a34.2.1740700620481;
        Thu, 27 Feb 2025 15:57:00 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:87c8:8ae4:f338:6188])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-728afd7694fsm443893a34.50.2025.02.27.15.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 15:57:00 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Cenk Uluisik <cenk.uluisik@googlemail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Florian Klink <flokli@flokli.de>,
	Muhammed Efe Cetin <efectn@protonmail.com>,
	Ondrej Jirman <megi@xff.cz>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH 0/4] Orange Pi 5 series HDMI extras
Date: Thu, 27 Feb 2025 17:56:19 -0600
Message-ID: <20250227235623.1624-1-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_155702_164264_9BEF03A9 
X-CRM114-Status: UNSURE (   7.00  )
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

HDMI Audio and HDMI1

Need testers for Orange Pi 5 Plus

Jimmy Hon (4):
  arm64: dts: rockchip: Enable HDMI0 audio output for Orange Pi 5/5B
  arm64: dts: rockchip: Enable HDMI audio outputs for Orange Pi 5 Max
  arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Plus
  arm64: dts: rockchip: Enable HDMI audio outputs for Orange Pi 5 Plus

 .../dts/rockchip/rk3588-orangepi-5-max.dts    | 16 ++++++
 .../dts/rockchip/rk3588-orangepi-5-plus.dts   | 54 +++++++++++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi |  8 +++
 3 files changed, 78 insertions(+)

-- 
2.48.1


