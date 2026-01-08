Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B8ECF6AB6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 09:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DtIN+U3vfCr3zEjBHzX6oM4do/3hxJWl7iyhruf7srI=; b=b503fd+TZcZiXN0tZtuTsmbgTg
	1NzkpLQq8CPMQu7ILDuxKvHcGgleZYl3rlnKqHHpzOVoQxG6Yb+b7Zdk+46Z2CcExulITIe79eZQ8
	Lnqv35IpxUgBLAyZWGuDNrCSI/fIx59wnvHW/YaGZEeKfNdWD6hFqbF0lMxg8XcCx8O0vjFCw50zb
	PubmerqgtDtYbE5TJRSfUj8JovgmMPpYCU5CBhQC43qBST5XxmL92meOP7nvYG2ngZJ+0uPpKZdHS
	3DPMqW+Jnq00w1dsT1IIm7pv6zd16isWP5UoEwHsI9bi5n1Owv4jzOJyEEbT3mPqWrtTv/4I6+TFo
	yQJNw2JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmSQ-0000000GUTr-0Zfq;
	Thu, 08 Jan 2026 09:37:30 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmSN-0000000GUSm-2L5c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 09:37:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767865033;
	bh=DtIN+U3vfCr3zEjBHzX6oM4do/3hxJWl7iyhruf7srI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=X8Zh6SMdTyodMLssOQ3O7TKAoEPFh6iqNodDHJeC2Uy6VOj2vnzyTbYc9gZosTuip
	 OGY+JVUtwbRcGh+Fpa0SDRaAupzoaPeBSsbajmLa8W+AJlTMKL/Gn0bCU6ow1nRsQB
	 roNAh/OymbyKbGjX7c9120pangqNthVSnX/dCKrnx52AUGOLcCn7smRQiFtiLLhMCq
	 DMu88Bica3Jv2Uuq4HlMvzVMCO5UtDM5l5icXPrDXGwE8rUHli6ljh7q3Sry2gHVtl
	 riDRUDzfk5jKfHMs+ifuCtvzFqUtaZJOgIu65PYfsw8Vv+L5Ejr7DXVEUVoeMRY9gD
	 UiS7LkzSSEyGA==
Received: from [127.0.1.1] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id AD5C179F8C;
	Thu,  8 Jan 2026 17:37:12 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Eddie James <eajames@linux.ibm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260106213153.2766411-1-robh@kernel.org>
References: <20260106213153.2766411-1-robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: aspeed: ibm: Use non-deprecated AT25
 properties
Message-Id: <176786503263.1448890.555842411272962996.b4-ty@codeconstruct.com.au>
Date: Thu, 08 Jan 2026 20:07:12 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_013727_794910_A23BB3E6 
X-CRM114-Status: UNSURE (   7.96  )
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

On Tue, 06 Jan 2026 15:31:51 -0600, Rob Herring (Arm) wrote:
> The at25,* properties have been deprecated since 2012. These platforms
> weren't upstream until 2020 and 2023, so it should be safe to switch
> over to the "new" properties and just drop the deprecated ones.
> 
> 

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


