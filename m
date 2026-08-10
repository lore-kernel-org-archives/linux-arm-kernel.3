Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223B8C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 16:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6psFmX+whGh5ZZ74Fy/hGR0x2rNCYEasCgWYf7g4Ywk=; b=Xa/mo3Noy5U2ZD3/ryiRyual0J
	/PmvxesZAnjedYZFy0dFXSol3LqhEbF1/r7I2E2apeQXxqEH2iDWkK1puLSTB/i83EP7qDuWHpWek
	U4gQMer+NAWTHp0cJ00XdJSys0KCIqqp0yMNaHTPKDxQU1lTtk0hGafqs8FOyLwxRkqlHBgp90t/x
	RP7IvVoEfCP90BqhxXqcoPP5PObe5+5cU4vtopBwhFOZk4U/+rHVrCJqIG42Y8Roe0G0dHBjnFkSO
	EkZmD6GZgsVL0Qx+/7CZi6+aaPs72X08g4iaUm+y7OrdKkLrT0pNQOTZHmLy7hz0nPcRvU0fMDvQI
	cHP6K48g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSU7-0000000CKyO-0aWm;
	Mon, 10 Aug 2026 16:04:19 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSU1-0000000CKw8-26Tx;
	Mon, 10 Aug 2026 16:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1786377833; x=1786982633; i=wahrenst@gmx.net;
	bh=6psFmX+whGh5ZZ74Fy/hGR0x2rNCYEasCgWYf7g4Ywk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=DgnM1zYk8afM0/8XlPatK1GmS9arhJ5ZcE5rdKvh1ab+qK03BvjWUDQTMiclqlLa
	 NpwrEw9dZHqG9GDLhTsD/wJQ4tXouPgmCaafP0o8DAE36YpwD3jzhXNj2e4Dyalkn
	 WfgndWovO7vUnBl6gNPUYKGMztrFSAtGuj2ASsg7oe6cnBjYWUuhmX3Wc+Zk86vHl
	 7VQ4uAezgTcHeqfzSPTfvzzJaF4bSG4kgxBw/EFwujajfa+qf0OAkTWAPqenFBe7u
	 Ysr0xoMeKGeDGwMCU15fxQl/wlpsxoPL4tStKqprn+5R2mVLqn/CRwS7ucHE2UfS9
	 bP30sMQwOemmEW7tMw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgvrL-1xMjUS386X-00b1u6; Mon, 10
 Aug 2026 18:03:53 +0200
Message-ID: <abecb718-09db-4dad-831d-180cc4df0d3c@gmx.net>
Date: Mon, 10 Aug 2026 18:03:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: bcm2835: Add 2712-d0 Stepping
To: Gregor Herburger <gregor.herburger@linutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Eric Anholt <eric@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260810-bcm2712-d-stepping-compatible-v4-0-73f74479539c@linutronix.de>
 <20260810-bcm2712-d-stepping-compatible-v4-1-73f74479539c@linutronix.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20260810-bcm2712-d-stepping-compatible-v4-1-73f74479539c@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:/cV31rWU/QzuCJLSUAVzRmb4oFXKnA+h3HYtrFc8NQ5f4+BnpW2
 2iWBxiZnV1n1b04nzRzn1l66ranpn3wz1rwEHmWunjh9eY7yNhQ9bzP3I6TXlxygZUMzAPj
 7GRgTY4gF3b3ssJaLDbolq1CvjFryF5YPfoDrtH2r2IDAqdMUsvz6c8gzmSk/vwQCqh0I8t
 wDDFAXCw83UwFS2BnzfEw==
UI-OutboundReport: notjunk:1;M01:P0:40kQRtGW0l8=;pz0y/y1iXqBzvRuqcpk6JNbqmVX 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 2/969uZwYwjy36P8E4aNl9oNqN9kkk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_090413_903978_6C302AFE 
X-CRM114-Status: UNSURE (   8.23  )
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

Am 10.08.26 um 13:46 schrieb Gregor Herburger:
> The bcm2712 SoC, found on the Raspberry Pi 5, is available in a d
> Stepping and in a c Stepping. The two steppings are not compatible.
>
> Introduce a new SoC compatible string together with a new board
> compatible string.
>
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

