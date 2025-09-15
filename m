Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB909CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 21:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcnOv9TVIssJ3RWBuTl/9ezOh7E4+HVF6kM6clQqSQI=; b=O52kLhTHAHSFhofxUEQSechEIL
	5PQWwn3bN4Bdqxc0u7YplGE+PtULRi3L6kZa7zui8FTx+2p4FLeNpyGrLRor6YXTk73Lu4mkWZIui
	BG3hf6FYmO+J1lQxramdQH/GNp3FrlYAQ0IjD16DQ7tSWkp1NaHr0tb4AKQWgk18qIvwvtW/fAn4D
	2azqlito5RQ2yeoaYOGUko6GkLizwbZAKOZxFnImllvmBGBOjIMUkd1CBSuu75HGT3XBxZ0dolT6a
	2cgyGlkvIBGYIFJUDSXwh9bqw6SQsqBqU3Hi5J1QDTL98TM9S6vn4Wh+kU1urzJ4quatOphDZO8f3
	UiD56iYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyGq9-00000005iNw-1gp1;
	Mon, 15 Sep 2025 21:34:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyGq7-00000005iNV-0gZu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 21:34:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CED9E45048;
	Mon, 15 Sep 2025 21:34:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B327C4CEF1;
	Mon, 15 Sep 2025 21:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757972062;
	bh=EQ9er1liAcJ0+LgMZjQy4CDVJThm9UrjoRfFH7qfXIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=coWvyVeCz1LjDVyYAu06PP1m/8FpKwRYQqc8+hGy/A+U9tNUwRQ4jN2a/JppPCaDF
	 iNBlXJN6If8azp/Oa3mMmC2Slbx20pHDJgNk8lHZhyBndkClSsI8H8NOOAuF4fVH6z
	 kH4HMrL4ceSFP/bhVgP66HW7evVSh2XXCpa88pD89GQVKabsQInk5339ALT+V3ImV5
	 hb2BvGTTl7Wh82KVNVJU5GNY6jpFM6SBV6xr7OLMl4oijIUP8pt1XEk5TiYfIRh7lK
	 MxcjWW08uOuMBPPVMvw7smbSgK69p0+nhjCpQX8y+QC7X20Ltplc5VWJNwp2lSNjSK
	 xOkdBBD7Us75A==
Date: Mon, 15 Sep 2025 16:34:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Andrew Davis <afd@ti.com>,
	linux-hwmon@vger.kernel.org, Tero Kristo <kristo@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: mfd: tps6594: allow gpio-line-names
Message-ID: <175797205997.3572376.2459188333826155892.robh@kernel.org>
References: <20250912120745.2295115-1-mwalle@kernel.org>
 <20250912120745.2295115-3-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912120745.2295115-3-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_143423_219350_3CD0762B 
X-CRM114-Status: GOOD (  10.39  )
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


On Fri, 12 Sep 2025 14:07:40 +0200, Michael Walle wrote:
> Setting the signal names in the device tree was already possible, but
> it will lead to a warning. Allow the gpio-line-names property to fix
> that.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  Documentation/devicetree/bindings/mfd/ti,tps6594.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


