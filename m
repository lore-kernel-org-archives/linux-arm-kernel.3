Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3839C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 19:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nAlvhT9ZFVfUmfohNEsGAIiJycxNx79GkgwG5v7mMMM=; b=1nKrh63yAbK05fZBsBRrKG80Id
	Utddgk/oqc6rGnZcLpvKQPv84tnVpb6rrcOslpiKHQFoglKjttVtFvxSJiImfFgAAengaQm1bDeSk
	+Il3+oALDlzpDh1Fp5mhKXxuZlIPkwew07rZcyFqMoDJUnDRCQvxFV2ZEAWd91+p0nafYEbxH8YG+
	hXiYpZIibWHyPyLuefEDMb2gJItJMP0uz88Rv5dPV2sIkSUh87dUa+l/j3mpePuVdez8OE9z0WAjf
	DPT/LHfzfhG5wZFYsunMToKaqWS1cvp5qSwOyKKD9vpbgpLTvC61AlJi0lJe1zA8NXzIsobKNHprA
	pXMh/1bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x417r-0000000A2LV-30eI;
	Tue, 08 Sep 2026 19:04:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x417q-0000000A2LK-0sMI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 19:04:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 818024366C;
	Tue,  8 Sep 2026 19:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED8A11F00A3A;
	Tue,  8 Sep 2026 19:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788894297;
	bh=nAlvhT9ZFVfUmfohNEsGAIiJycxNx79GkgwG5v7mMMM=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=kvTW2nXnK9NPn+KZPTaSpQw2CMzcjpxXCmhV+zAQ6KULwEikZwPiTFJcVOK2dYyq+
	 5wT4sV6KnmZ2T0O2M/oa34mR/goSmPjQ9Y/tZ0Q0YBsNGuQ1gClu0JoFjvBZqURkNy
	 QkPnaGf9beKojMen/LTiGSzqyx09/cqxQ2oQ6KSV3zdZbTUbTiXwB/uAqKdrWAAY/v
	 qOP+DhozJXFqcUAcQ+42mdOgXyzGJu/Ys6pvEwQGxZeXJXXqERDf5m6EW7XeYWtz52
	 s7SPqs1oaYy2ghXl0tggjejR8C+I5Dry7Njfu8alfchQKW4L1y3rurh8+pOm4U3ztI
	 vzUdIIxjdjvzQ==
Message-ID: <f6549175-157b-4569-ab97-ac9377d060ea@kernel.org>
Date: Tue, 8 Sep 2026 21:04:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/22] thunderbolt: Add Apple Silicon support
From: Sven Peter <sven@kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
 <20260906-b4-apple-soc-tbt-v2-19-1f80085f93fb@kernel.org>
 <20260908091844.GD106095@black.igk.intel.com>
 <22808191-5310-4d90-9fac-68d0d85b4c54@kernel.org>
Content-Language: en-US
In-Reply-To: <22808191-5310-4d90-9fac-68d0d85b4c54@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

> 
>   &dwc3_0 {
> ports {
> #address-cells = <1>;
> #size-cells = <0>;
> 
> port@1 {
> #address-cells = <1>;
> #size-cells = <0>;
> reg = <1>;
> 
> dwc3_0_ss: endpoint@0 {
> reg = <0>;
> remote-endpoint = <&atcphy0_usb3>;
> };
> 
> dwc3_0_usb4: endpoint@1 {
> reg = <1>;
> remote-endpoint = <&usb4_0_acio_usb3>;
> };
> };
> };
>   };
> 
>   &usb4_0_acio {
> ports {
> #address-cells = <1>;
> #size-cells = <0>;
> 
> port@4 {
> reg = <4>;
> usb4_0_acio_usb3: endpoint {
> remote-endpoint = <&dwc3_0_usb4>;
> };
> };
> };
>   };
> 
ugh, Thunderbird messed that up quite a bit. let me try again and see if 
it keeps the indentation this time:

   &dwc3_0 {
         ports {
                 #address-cells = <1>;
                 #size-cells = <0>;

                 port@1 {
                         #address-cells = <1>;
                         #size-cells = <0>;
                         reg = <1>;

                         dwc3_0_ss: endpoint@0 {
                                 reg = <0>;
                                 remote-endpoint = <&atcphy0_usb3>;
                         };

                         dwc3_0_usb4: endpoint@1 {
                                 reg = <1>;
                                 remote-endpoint = <&usb4_0_acio_usb3>;
                         };
                 };
         };
   };

   &usb4_0_acio {
         ports {
                 #address-cells = <1>;
                 #size-cells = <0>;

                 port@4 {
                         reg = <4>;
                         usb4_0_acio_usb3: endpoint {
                                 remote-endpoint = <&dwc3_0_usb4>;
                         };
                 };
         };
   };


