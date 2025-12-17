Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7245DD66BBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 23:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2mq0Gx7GZeTynP2HqywdZDBMJbkGwWK5LlhAShzLmQ=; b=n4Tt3J5GwszchJACh77AZ/c8RH
	nqLHImvjAnuFV6EZJYmDB5LXeq5C2BzeA0imq1GrAnyzbjZIy8r08ieGIcvvmt3umJWG8pX3QqVlW
	9q2mT7qzcQSDU1Kvf21m9YdGxcEsQK+gtxTPI8o9FvQ8Wem7rWJbRjauycN5WQEmguHQskWRZIRmC
	jUhA9jpfryHcsXQdT13XM+dBkTyv0iHilnxOwRu3+Hj1AcwbI9/0+Le29FRuariSb+jBerVLYWneY
	fr6w77492k/i1yAyuHOcpfqI1qPyf2gScgVCHFAHg5qP7EvV3h/ECGksPdEjEgWhdCan2/WPwBDeR
	uHXKgUww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW0zc-00000007Xr1-17IQ;
	Wed, 17 Dec 2025 23:31:40 +0000
Received: from m1-out-mua-15.websupport.sk ([2a00:4b40:aaaa:2101:45:13:137:24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW0zZ-00000007XqY-0UW1;
	Wed, 17 Dec 2025 23:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=probably.group;
	s=mail; t=1766014290;
	bh=N2mq0Gx7GZeTynP2HqywdZDBMJbkGwWK5LlhAShzLmQ=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=aH9uNQNkP+QzUUguji0xI1K+VchucuyeSDKy/54IGGTCPJC2kPIDnxalJ+VxlrCDy
	 1UR5LDchY6sRTknWwHKo9UKeCM8BSqkV5doFIsRvsd0Zqp9UeV3eOkUv2bR67bQrim
	 cv5+ObQZntiuEtbW4yeGhw3Lax1q6VADwJp1LxDuX5P/NnhJsrLyp4d7HYAwd+pdp7
	 I0mM8VOsOLFD5HivqkwVN8fKz1D3Ivp9qvnfdsSh2pxKtKXHh83splYpjoZpfN0mcG
	 bymuITuTmDGwXf/PdwTU8MqAtdIrFgQ3ElS5bth7/+g4FSGrPf0DLSeFhwaqs40c/u
	 OB0I/7mjG4UuQ==
Received: from m1-u6-ing.websupport.sk (unknown [10.30.6.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by m1-out-mua-15.websupport.sk (Postfix) with ESMTPS id 4dWqnG2CSGz1Md5;
	Thu, 18 Dec 2025 00:31:30 +0100 (CET)
X-Authenticated-Sender: mh@probably.group
Authentication-Results: m1-u6-ing.websupport.sk;
	auth=pass smtp.auth=mh@probably.group smtp.mailfrom=mh@probably.group
Received: from smtpclient.apple (unknown [109.164.127.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: mh@probably.group)
	by m1-u6-ing.websupport.sk (Postfix) with ESMTPSA id 4dWqnF0STBzdMvK;
	Thu, 18 Dec 2025 00:31:28 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH] arm64: dts: rockchip: enable dual 2.5GbE on Rock 5T
From: =?utf-8?B?Ik1hcnRpbiBIb2xvdnNrw70gKFByb2JhYmx5IE5vdGhpbmcgcy5yLm8u?=
 =?utf-8?B?KSI=?= <mh@probably.group>
In-Reply-To: <176580661874.1441131.12947657582985645446.b4-ty@sntech.de>
Date: Thu, 18 Dec 2025 00:31:18 +0100
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <7A2ADADA-3FD8-4AAE-B7D8-9137399FBE6E@probably.group>
References: <96516D1F-9787-47FE-A67E-4745D11D9207@probably.group>
 <176580661874.1441131.12947657582985645446.b4-ty@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-Out-Spamd-Result: default: False [0.40 / 1000.00];
	MV_CASE(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:44489, ipnet:109.164.0.0/17, country:CZ];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	RCPT_COUNT_SEVEN(0.00)[8];
	HAS_X_AS(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+]
X-Out-Rspamd-Queue-Id: 4dWqnF0STBzdMvK
X-Rspamd-Action: no action
X-Out-Rspamd-Server: m1-rspamd-out-5
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 1109
X-purgate-ID: 155908::1766014290-C0FE6043-56D75A65/0/0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_153137_438291_CE6ECCDF 
X-CRM114-Status: GOOD (  12.88  )
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

Perfect, thanks a lot!

> On 15. 12. 2025, at 14:51, Heiko Stuebner <heiko@sntech.de> wrote:
>=20
>=20
> On Fri, 12 Dec 2025 17:23:35 +0100, "Martin Holovsk=C3=BD (Probably =
Nothing s.r.o. )" wrote:
>> The Radxa Rock 5T board features two RTL8125B 2.5GbE Ethernet =
controllers
>> connected via PCIe lanes pcie2x1l0 (fe170000) and pcie2x1l2 =
(fe190000).
>> Currently only one interface is functional because the PCIe =
controller
>> nodes lack the necessary reset GPIO configuration.
>>=20
>> Without the reset-gpios property, the RTL8125B PHYs remain in reset =
state
>> and are not enumerated by the PCIe bus. This results in only one =
Ethernet
>> interface being detected, or none at all depending on U-Boot =
initialization.
>>=20
>> [...]
>=20
> Applied, thanks!
>=20
> [1/1] arm64: dts: rockchip: enable dual 2.5GbE on Rock 5T
>      commit: 96029ffeccf677b1e4baa98f30909a83a485b6d7
>=20
> I've resorted both the pcie phandles as well as the pinctrl entries
> pcie2-0 comes before pcie2-1 etc :-) .
>=20
> Best regards,
> --=20
> Heiko Stuebner <heiko@sntech.de>


