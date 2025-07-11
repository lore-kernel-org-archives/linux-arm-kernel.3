Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9EBC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 18:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7nAQ8MFihVRjT4v6jCf4oIhuL2he8+p7e3TrE0+kYI=; b=WycT3gQH33rDpY/vSENX1P7cgJ
	k+05rvDbIMnSfqyXqaGe6jYp9CmLw5rSrGC3YKFJ0L2GACgS30eJRo2+24KPabN1iB9Yy7eLTLvu1
	jhvQyKNK49A40vYF4aTqSENA7SKQKSdHAYIkrSvjnEXdSB+tQXheqs51utWmycgq9zoAYVUc1V8x1
	zjUKX2dun/dva++kISyXWxL+jlIDj2aa4V9FHS+yJSx1uAYKv2OTwxPR9zIPmehx83TMKv/dwViMA
	nT24D1a92dBC3lF0lez4cPSqcbadB0qDjpwIUI8E9El0yER8jHXPhqIaCceh/jcI8FLJ3ufvLn4Qm
	RpnY8rDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaICi-0000000FT3E-1FEy;
	Fri, 11 Jul 2025 18:10:36 +0000
Received: from flow-b8-smtp.messagingengine.com ([202.12.124.143])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaHir-0000000FQ1l-1LHu;
	Fri, 11 Jul 2025 17:39:46 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id F0F6C1300AE9;
	Fri, 11 Jul 2025 13:39:40 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 11 Jul 2025 13:39:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1752255580;
	 x=1752262780; bh=/7nAQ8MFihVRjT4v6jCf4oIhuL2he8+p7e3TrE0+kYI=; b=
	BNRI7qml8FGqqjAjz4ECuSXh4sUCbOHlAfr9QmNo21rjBp7/dg/LIiLEY3xEKDYg
	fYjQ7KQL9lbUb4UoeEAhrzrsLxuKPySftGrqE6HRgMhm++bFQDJhzNHSjHy/0fRL
	tOxYfhllkHVoy6G99ytXT5Vm9F2GIJ4efWkE2UcQl5sMP+E1LDC/ytS1YsUnCjvE
	Y1V+Vm1U4IbvoVykZ8hRTHtrUnzXUuDwNikD1FlWtj43IDoCx4eJfuyDj1ZtaViC
	YA1mktP6p/K0wk7tUO7PDcvxTMh812zGXM7QCfj2yostqeHD4py0IqVBv+NGLEBD
	62Bd0eKpqVW/xRTn/tndcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752255580; x=
	1752262780; bh=/7nAQ8MFihVRjT4v6jCf4oIhuL2he8+p7e3TrE0+kYI=; b=k
	g/6aE9gWmA1nQ2IF5rhoo758cBW7YBIcJMB7Gxh3UOcFWttFsFuIiS3oMZGU0tAw
	f8KExaR9ijyYiaWaBux3y0iF7eaI7wGIKf5hbFw8j7nlNRM/ySiN8QKXw30/LPiT
	uw7bf3U8b6mmh3Ln5QZFuQmMM2RI71easRsoDwEu+XV4BbIq/XxXKDsJcrQNjtTV
	1qpyf/j4/hQQ9E78WwRx8NXZT0XIuOFe1MdZlMhkgEZsjotLENbKAD79el/JOXd5
	eYmfznEkTDoUmc2CCp8sugqZLXXyuQzj+kf5Emo+/hLI7xvZjJGflZGy/CxBstHh
	Nn2XRsVbXP/W44n9wKzwQ==
X-ME-Sender: <xms:WkxxaAy6ubjXTr4Nr3GqrLfMPAuOl6P_C6EqtSatLOBP6xBRgcD05A>
    <xme:WkxxaEQbQbfx7KVZqVEZ7vCzymFyNiE2UyyUyKdwb2gB3N44toNbXvmGMgHMNhQtt
    6b8oMf0CLqT2M0uE8I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfeelfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegfedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepshhouhhvihhkrdgthhgrkhhrrghvrghrthihsegrrhhmrdgtohhmpd
    hrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphht
    thhopehmrghrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehsuhguvg
    gvphdrhhholhhlrgesrghrmhdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgs
    vghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsggtmhdqkhgvrhhnvg
    hlqdhfvggvuggsrggtkhdqlhhishhtsegsrhhorggutghomhdrtghomhdprhgtphhtthho
    pehflhhorhhirghnrdhfrghinhgvlhhlihessghrohgruggtohhmrdgtohhmpdhrtghpth
    htoheprhhjuhhisegsrhhorggutghomhdrtghomhdprhgtphhtthhopehssghrrghnuggv
    nhessghrohgruggtohhmrdgtohhm
X-ME-Proxy: <xmx:WkxxaOOV1N-8cl8ewsOEadvfG9DMjh2ELghTwN74WNv3Gt0JyYjdHA>
    <xmx:WkxxaIr6oCFMaVmWU7gxOVhY4rm3xw3dXBakD_FIPF7wB40OD4bF_g>
    <xmx:WkxxaNScigY_hlnDbZTVOu3n_jiKONFprcnm_y-D-b4g8TtNSC1wFA>
    <xmx:WkxxaM3NFQKdNmcyxUur-EZMEEThitW_iCEZiwnrKDKhCenUTLnX9Q>
    <xmx:XExxaGAHDmkRJpoC78wbh25FI-BA2SRsBk3w8jQ6FIofe9fmBAXSmU4N>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2721B700065; Fri, 11 Jul 2025 13:39:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T7b8765a73c29189d
Date: Fri, 11 Jul 2025 19:39:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>,
 "Rob Herring" <robh@kernel.org>
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Sebastian Reichel" <sre@kernel.org>,
 "Sudeep Holla" <sudeep.holla@arm.com>,
 "Souvik Chakravarty" <Souvik.Chakravarty@arm.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Andy Yan" <andy.yan@rock-chips.com>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Olof Johansson" <olof@lixom.net>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 cros-qcom-dts-watchers@chromium.org, "Vinod Koul" <vkoul@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Elliot Berman" <elliotb317@gmail.com>,
 "Stephen Boyd" <swboyd@chromium.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>,
 linux-samsung-soc@vger.kernel.org, "Wei Xu" <xuwei5@hisilicon.com>,
 linux-rockchip@lists.infradead.org,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Sen Chu" <sen.chu@mediatek.com>, "Sean Wang" <sean.wang@mediatek.com>,
 "Macpaul Lin" <macpaul.lin@mediatek.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Ray Jui" <rjui@broadcom.com>, "Scott Branden" <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Elliot Berman" <quic_eberman@quicinc.com>,
 "Srinivas Kandagatla" <srini@kernel.org>
Message-Id: <b870ed33-7d4f-4b0e-a9ae-b9c374ea854b@app.fastmail.com>
In-Reply-To: <28f277af-9882-2c70-5156-123c95adc2ee@oss.qualcomm.com>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
 <20250710-arm-psci-system_reset2-vendor-reboots-v10-2-b2d3b882be85@oss.qualcomm.com>
 <20250710224740.GA15385-robh@kernel.org>
 <cdadd6cf-18c9-15c7-c58a-b5d56b53452a@oss.qualcomm.com>
 <454c8361-151e-42b3-adfc-d82d2af62299@app.fastmail.com>
 <28f277af-9882-2c70-5156-123c95adc2ee@oss.qualcomm.com>
Subject: Re: [PATCH v10 02/10] dt-bindings: power: reset: Document reboot-mode cookie
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_103945_746170_4A747A1F 
X-CRM114-Status: GOOD (  11.17  )
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

On Fri, Jul 11, 2025, at 19:00, Shivendra Pratap wrote:
> On 7/11/2025 8:14 PM, Arnd Bergmann wrote:
>> On Fri, Jul 11, 2025, at 14:32, Shivendra Pratap wrote:
>> 
>> The distinction between cookie and magic value may be relevant in the
>> context of the psci specification, but for the Linux driver, this is
>> really just a 64-bit magic number.
> ok. then if i understand, this binding change for reboot-mode be dropped
> and driver can internally handle the two 32 bit numbers?

Yes, if you can easily keep it internal to the psci driver, that
would work, or you could just change the callback type to take a
64-bit number and leave the interpretation up to the driver.

     Arnd

