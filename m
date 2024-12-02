Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6B1D78336
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 16:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+tY5dhk7/LT3n7Hrn9E5YmAs+O+7iQE1LKrHVseKkg=; b=PFLFh8+9u5dtwb9ZlkGMz6ytY6
	pFeT2CFZiKgZxY6yMVUcDCqxJ53pdVdRYO+4aLIUVKJksjCrQXfPEfX1UXFkxw5Eha4d5i3PbHbuk
	NCXLc1WCcadbNRO2+9Ys1ViPp98yOw5i/rxI3NWCRLi+6dWz7xQ09HkaGKOCkgmgn2I2UK4R071zP
	sUT6T4j0G8FJYiHs5JKwLxVJswPeujiOxkzdw35Fx++GD81xP3tVSOfR86wMYc6R/J4w7Uh4ImqeA
	Aqp4oZKWCqmnhKhyplpz61+CT6zFa063TDTZPY1jsgH8Lwqz03oHsUuUii9lj7d+fti11q39PeudI
	uIv106Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9CK-00000006paY-1yn1;
	Mon, 02 Dec 2024 16:22:56 +0000
Received: from out-03.smtp.spacemail.com ([63.250.43.88])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8w6-00000006mKq-3x9j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 16:06:12 +0000
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y27tj4c7CzGp3g;
	Mon, 02 Dec 2024 16:06:05 +0000 (UTC)
Received: from umer-b550pro4.lan (host-213-78-252-153.as13285.net [213.78.252.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y27tY2H9zz6tkK;
	Mon,  2 Dec 2024 16:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733155560;
	bh=rf3tmdsNPhNTXCWTXYttONTJQUg5LXdbItehquCHLoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E/bVuty0ksgZbd+R3sKLadsOLuXj9zd02pmVZghBvEktX0XXII9fLQCOgKbmBFXB+
	 RdhUl2Vx2ickBwg0E9GZhEWO9hnhuhyRXGH+eSQ4io+fzWLeiot1rgzclGOSjcuXjJ
	 tGgemc2GLr/p2Cv6aSK9KGzuG3NLXbXhd383dHiaekyLYAcAYhS0wJ5qELxyEEBJYt
	 MH0KrR8AIOgxKROvRGNuGJ5jwd4rSq1jsGQ1REqKky4dQmsWxsf+qP1Sblz9M65UVS
	 /mmV+nJ9kPmqff15FFflHeiYQ1Bm01cuwZsXc3bAOMDqzLAM1xYEEbbrmzrnq+02yP
	 lIBNr9yS8+cgg==
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: ivo.ivanov.ivanov1@gmail.com
Cc: alim.akhtar@samsung.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	robh@kernel.org,
	umer.uddin@mentallysanemainliners.org
Subject: Re: Re: [PATCH v3 3/4] arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G (x1s)
Date: Mon,  2 Dec 2024 16:05:48 +0000
Message-ID: <20241202160548.3672-1-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <9f48459e-f381-446a-86bf-c8d1bb8858bc@gmail.com>
References: <9f48459e-f381-446a-86bf-c8d1bb8858bc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_080610_997022_FD10E95E 
X-CRM114-Status: GOOD (  11.96  )
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

On 14/11/2024 10:09, Ivaylo Ivanov wrote:

>> +
>> +/ {
>> +	#address-cells = <2>;
>> +	#size-cells = <2>;
>> +
>> +	model = "Samsung Galaxy S20 5G";
>> +	compatible = "samsung,x1s", "samsung,exynos990";
>> +
>> +	memory@80000000 {
>> +		device_type = "memory";
>> +		reg = <0x0 0x80000000 0x0 0x3ab00000>,
>> +		      /* Memory hole */
>> +		      <0x0 0xc1200000 0x0 0x1ee00000>,
>> +		      /* Memory hole */
>> +		      <0x0 0xe1900000 0x0 0x1e700000>,
>> +		      /* Memory hole */
> 
> The space from 0x100000000 to 0x880000000 isn't a hole in the memory
> though, is it? 0x880000000 is in the 64 bit address space.
> 
> Best regards, Ivo.

Hi Ivo, This device tree was based on the work done on c1s and
Igor had also labelled the part as a memory hole, also same with
the r8s device tree done by Denzeel, also downstream fdt skips out
on this region abruptly hence why I had also labelled it a memory
hole.

