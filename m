Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F78C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 03:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aulBUN1tA6kZl7+XoEHv5GG7KpCshb3srvdgPwEckPM=; b=WRxTADamJB5kQivZWRMsGMlkWX
	jY0UstTPCMAFR27X+7kuOeV/JiYztTN80jNOvN6TIw9TN6GigpOAvYwtAAeeIFP7tQ/Z2ndKImTkQ
	Guz9FOAWnEHMVdctIO3sy9D0kszswoflWdEbAYXgMZuK7KpoyqQInpbCgVqIfr3iqsHOMAT+KU0n9
	YA5ct9CPl8bXa2zxeOWciD14IXPMxxueerBE78k1Sc+xZt/lQNcgs4gsHeYbvENh5w7Yj3CTVNvtX
	BL2ZN2XGUEJmlUzB1uDGGx7GxFiTGMRupSgfxg0cF8d08esdXKbjEUm3sQg2Mkm8hiWNpxO79Cb02
	IsivtDlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x73Es-0000000AXns-1Fel;
	Thu, 17 Sep 2026 03:56:46 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x73Ep-0000000AXnZ-2cTj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 03:56:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 10FDA1001F5;
	Thu, 17 Sep 2026 05:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789617400;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=aulBUN1tA6kZl7+XoEHv5GG7KpCshb3srvdgPwEckPM=;
	b=fTYCLd/b8tZaj1yEk4+fsOJXwg9sE1xiH+ukXXaNflaaPVgY5VDF0EelJK2TUmgIEEe48x
	S4TPBF1LiO+6E/iIq8AI8Y7cICuem9O4Kc4ln0s8kBwprNKMZB7SXMiGPSZ2mkIEXm8PAh
	QtyfPHHn0BItAZpJ6gTN/3CfluNSlZj6W+Tih3wueUBtcqCoJH7JVvBpv/2ed+NiiGVMy3
	R8Cyci3GmmhYmvD/WHnBxykEQiOzY10AXAQc3rIZX6/I6z3HAn6Yxp/okG7HHZs8QGouqa
	iPDC3VpZtvg2yQwoNoxs2tcqFDZT1EoPxyTmKo/Tr8pZqI5wT+E4tjwX3HkOow==
Message-ID: <f4dbeaac-ab10-4980-9fc5-533907be223c@nabladev.com>
Date: Thu, 17 Sep 2026 05:56:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: imx95: Add support for Data Modul
 i.MX95 eDM SBC
To: Frank Li <Frank.li@oss.nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Aswath Govindraju <a-govindraju@ti.com>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-can@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260917024805.517030-1-marex@nabladev.com>
 <20260917024805.517030-3-marex@nabladev.com> <aqtfcREBJLMzS0gn@SMW015318>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <aqtfcREBJLMzS0gn@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_205643_891724_D622B4BC 
X-CRM114-Status: UNSURE (   6.59  )
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

On 9/17/26 5:33 AM, Frank Li wrote:

Hello Frank,

>> +	reg_panel_vcc: regulator-panel-vcc {
>> +		compatible = "regulator-fixed";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +		regulator-name = "PANEL_VCC";
>> +		gpio = <&i2c2_gpio_expander_20 17 0>;
> 
> 						  ^^^ use predefined macro
> 
> use gpios = <...>
Is this all, or shall I fix something else before I do V4 ? I feel like 
I am already flooding the list too much.

