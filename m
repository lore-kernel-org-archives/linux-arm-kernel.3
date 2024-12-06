Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86AFEE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 15:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbEhDaMhaYRgHqg0j3y6E2dzcgnzRa0+yf2IRP/gbrc=; b=Iu5NFOHR5CoSaLwZ5c8oNv48yv
	Oo6jTW67MCCRBHlaziiBaD3mxpDsOyrokTlwZz0Q52Lp+Jfvxqw+3nhgFUr9VgGf5+e8r4d5ANi2T
	R564z1qZdD/QJyd6FmW0IrhcSjudx0BB0Ix3EMbFYHqwZibVQispr0qAdXZ4kr0yeiFJcIRkVn8jr
	3OOcnz91RGbQYHf80/qSUspcKQFY9tNFzf7A3YB/gdL5lWX7zCZ2x3fsnfDNG39rNBPc0Hl+csidD
	OVXwOuBbG4g/Rh0cMk6zhLDouDC0XoNNC3jvyZk1Sjhsd4IcjQwUW+h+lnhH9+nFMxjWU3BIBx2fR
	dU4+3K0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJaZA-000000022gu-2AQS;
	Fri, 06 Dec 2024 15:48:28 +0000
Received: from out-02.smtp.spacemail.com ([63.250.43.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJaWJ-000000022B8-2Yrm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 15:45:32 +0000
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y4bF65XZZz4w8J;
	Fri, 06 Dec 2024 15:45:30 +0000 (UTC)
Received: from umer-b550pro4.lan (host-213-78-252-153.as13285.net [213.78.252.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y4bDy6GfCz8sWh;
	Fri,  6 Dec 2024 15:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733499925;
	bh=jbEhDaMhaYRgHqg0j3y6E2dzcgnzRa0+yf2IRP/gbrc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JiMNspDuRphE9o3eaOZTf9bLQRkKlANAM+5hkXxAlwBtfYett3c1bD0njT1udq7U6
	 LP6SB1EJ/rGe9CrS+XotbLwGo+gTxTtLMBWBGDdjxeWiwmWi7VC085WFmd/mbVZA+v
	 GldaTpMIR+igDUQjiLTkFzwr1SoU/h7JTXBmsEe1zH439fIDeLLY2yWl8WRSTtMTpA
	 2zxPn+8BqOxhwPOvQI6qQaf8+VfVocDYIoyartHRF6Wz5yq6jh9ipRjFMvQbEltLG1
	 +ulb42RmhHvnKS84p9gNu3PAY7h4GIPxlmgQZOKDLwBtHhzy0dZaZUbDhDnwXxv5eQ
	 J8F0jLyDMbs8w==
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: krzk@kernel.org
Cc: alim.akhtar@samsung.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	robh@kernel.org,
	umer.uddin@mentallysanemainliners.org
Subject: Re: Re: [PATCH v3 3/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G (x1s)
Date: Fri,  6 Dec 2024 15:45:08 +0000
Message-ID: <20241206154508.4426-1-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <5e3e43eb-3afc-486e-aa9a-4c1074fd30b8@kernel.org>
References: <5e3e43eb-3afc-486e-aa9a-4c1074fd30b8@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_074531_665632_9DD16331 
X-CRM114-Status: UNSURE (   9.52  )
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

On 06/12/2024 14:11:28 +0100, Krzysztof Kozlowski wrote:

> Keep the order (sorted).
>
>
> Best regards,
> Krzysztof

Hi Krzysztof, really sorry that had went through, I had seen the error,
but by then it was too late and it was already sent off... I have
sent v5 off though, which should merge properly as the order has been
fixed.

Best Regards,
Umer

