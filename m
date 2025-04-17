Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DF7C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 16:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jkOBPoUk+xFY5ZKRx/7lO+ZCCZvZu8C4v3s/LGW1qvM=; b=4AM4j7Ot/OhLwV4OogfLsjsG9b
	0fktG4OI4N01VRG4Ec3YwsEUmsakEic2m7tNazqqENwnCm47MFxlmtEkhvWcuzs1nISpLHewv6xHl
	aUcA1K741hnbeUT04TECHAmmQ2MclNCiO2fEl6GRVyrNE67BvJXZ0+aKhz3qn/NNZMuYzb/yM4tlf
	VafSHB5XVhx4qRwy4DAA/O+z207BxOPkVA53GHhM0N2EYFxtkDR8+9DsJD6oRyQt9OKja+oQ8WPBJ
	7kgOISuqQIPGnNdF4frwd9Qpd5bdvP5JsLsLTrYrDqVPnCJoPcbV84dCLJTq1CyjcyJXS+rXRPsez
	JEXICr/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5RuZ-0000000DdcP-0hcz;
	Thu, 17 Apr 2025 16:16:23 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5RBe-0000000DWNx-1BdE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 15:30:00 +0000
Message-ID: <8d6c8f72-a8bd-43a8-b1e6-a20cafddf804@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744903792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jkOBPoUk+xFY5ZKRx/7lO+ZCCZvZu8C4v3s/LGW1qvM=;
	b=tINTPSUkz+lDh2u0qbUCc7IvYTHB0jtNBVFJ9GpvC7Xs047gwS9jy1iPUq6aP0+0OMpGTQ
	tDohhgUbbIgxhRG1BUFLBUe7j3DUUn7RwmiDGwOgZZ3tjEdqYt3iISZp4y0PSgaEgSxpjz
	LfFic1XsdEQ7osExW7l1Z8p7PX0VEsU=
Date: Thu, 17 Apr 2025 11:29:38 -0400
MIME-Version: 1.0
Subject: Re: [net-next PATCH v3 00/11] Add PCS core support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, upstream@airoha.com,
 Christian Marangi <ansuelsmth@gmail.com>, linux-kernel@vger.kernel.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Clark Wang <xiaoning.wang@nxp.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Joyce Ooi <joyce.ooi@intel.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Robert Hancock <robert.hancock@calian.com>,
 Saravana Kannan <saravanak@google.com>, UNGLinuxDriver@microchip.com,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250415193323.2794214-1-sean.anderson@linux.dev>
 <aADzVrN1yb6UOcLh@shell.armlinux.org.uk>
 <13357f38-f27f-45b5-8c6a-9a7aca41156f@linux.dev>
 <aAEdQVd5Wn7EaxXp@shell.armlinux.org.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <aAEdQVd5Wn7EaxXp@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_082959_023621_6154F8B9 
X-CRM114-Status: GOOD (  15.73  )
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

On 4/17/25 11:24, Russell King (Oracle) wrote:
> On Thu, Apr 17, 2025 at 10:22:09AM -0400, Sean Anderson wrote:
>> Hi Russell,
>> 
>> On 4/17/25 08:25, Russell King (Oracle) wrote:
>> > On Tue, Apr 15, 2025 at 03:33:12PM -0400, Sean Anderson wrote:
>> >> This series adds support for creating PCSs as devices on a bus with a
>> >> driver (patch 3). As initial users,
>> > 
>> > As per previous, unless I respond (this response not included) then I
>> > haven't had time to look at it - and today is total ratshit so, not
>> > today.
>> 
>> Sorry if I resent this too soon. I had another look at the request for
>> #pcs-cells [1], and determined that a simpler approach would be
>> possible. So I wanted to resend with that change since it would let me
>> drop the fwnode_property_get_reference_optional_args patches.
> 
> Please can you send them as RFC so I don't feel the pressure to say
> something before they get merged (remember, non-RFC patches to netdev
> get queued up in patchwork for merging.)

This series is marked "changes requested" in patchwork, so I don't think
it should get merged automatically. I won't send a v4 until you've had a
chance to review it.

--Sean


