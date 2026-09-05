Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30329C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 11:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2G74mMDoSzWYSciLrgMYcbatz2kFir3mltJmFJtTQBo=; b=cdTBQS32wXf00IE3pEV9+HXgmS
	8Oh92pUm8m7BebVfzVNJ4WhopshL1Rh1HHc7itK/c1BkAKfOOCfYRDJK0/qzj3/YDkNytVidXbvgG
	JG9FJ7SRqJeqz9sm56VU77+4OBi1hXVPLn73dtnefRIHggImiu0gY7XSxG+Uxh+4Bc1PVerG3AeA0
	dY0m7T7TCHyCX0qmFE2loXuob5OcrWbMSR3ejLzzgogNhXgxBnX1cC06xGKq2EiPJtEf6MIC1RnVx
	ECsTm4ii9GMDb9iAYM5/VzsV72wxS33zGrcgsTk2FW8sGamyU/I4n21b3GM1+M6JF97SRSYlHT3uv
	5OYPnjlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2oI9-000000040ZM-1Pam;
	Sat, 05 Sep 2026 11:10:37 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2oI6-000000040Z3-1zcR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 11:10:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9039C1A19CA;
	Sat,  5 Sep 2026 11:10:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5E9B860233;
	Sat,  5 Sep 2026 11:10:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4E49B11C79AE2;
	Sat,  5 Sep 2026 13:10:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788606625; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=2G74mMDoSzWYSciLrgMYcbatz2kFir3mltJmFJtTQBo=;
	b=w9fdaBoFJ6QLGxqG5SMb5jirUnc9KTDT6DGlJ4PpYqKfXBT/vhFNDW0RcspOWd0qzs6CG9
	Qy13+SDsWyvPJrCG4zJGGHT21oWhqpIjvnrdqCGphIBmEmzfTF/s9eJauV3hjsH9MH90TH
	xCpPntoKE1KOq5bMXJp2EGRoOCxgNzMDFZx92IrKP61l9NNQ8HT/pYOhrbhFZ5BcqopEEe
	xrDwQvGlTxrD864jvGDdBnrZ2G3S+/oP9ODLMVSuaUyk+T3g3cQmSyppu7JYyydq12+Yh0
	1meMNaurUlmkWyu3KzHmMGpBfrX4YX5TU5g/1xkN0qPLFGMFiN0+G/x/zoVZUg==
Message-ID: <ce07b2ab-60b8-44d1-9d72-23c6b6a85250@bootlin.com>
Date: Sat, 5 Sep 2026 13:10:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/9] net: stmmac: qcom-ethqos: convert
 ethqos_rgmii_macro_init() to void
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Richard Cochran <richardcochran@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
 <20260904-shikra_ethernet-v1-4-a50765996035@oss.qualcomm.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260904-shikra_ethernet-v1-4-a50765996035@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_041034_682664_E337151F 
X-CRM114-Status: UNSURE (   5.85  )
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

Hi,

On 9/3/26 20:43, Mohd Ayaan Anwar wrote:
> The return value is never checked by its sole caller and the speed
> validation duplicates a check higher up the call stack.  Convert to
> void and remove the dead code.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


