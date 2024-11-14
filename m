Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43892D6A221
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 20:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0++6dXAVCPi0KZyO/XBAzaiP8kdzMGhTrgoNcuxSRqU=; b=dPco0x9+CnjmaFHvHeA6TsNCcm
	dQ1N5H8anj7Ng1Wgfpz+B06AeJqfSMSQW/Zb/Wblu6H+GJ2pr3wJLa4/sf+1T21B1C56OvRcEG1a5
	mV0N8iCNGiMBJDTARGAhL2ZBA80nS548bZkYITF5zSaJTn/TOai8UbKcKxjHgbtTCCg+wDU9JGhmE
	oWcNk4MGBR1D8g0Vm00wmLUNS+u0NJe6gCrxibrC7VZ4Bvrjqi22ECPYfTdlItbM+jlZKnuN/fhzF
	GueQbdtdAcqNx1vwgAxws1eGjY0sdPmthInEIsiBwO/UtpyFaqO9pkqgucEB8pdMXSXYMPezWndEz
	aOppiuxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgFH-00000000jJ0-0SUB;
	Thu, 14 Nov 2024 20:15:15 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgE8-00000000iul-21dw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 20:14:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0++6dXAVCPi0KZyO/XBAzaiP8kdzMGhTrgoNcuxSRqU=; b=WBLrvnNLWXHBVmnBfpPazf9cJ3
	02yOKopTgZbBpAwsPq6jy821kjynjCDShFw9ZGxk3deGCCXSov0yHzb4Cd79u1Y1WnYfDm+Smrqq0
	SyzMStcezzCnHh2QtrthTTtYDu3+tExYDFyB5pbb4Locva9By/kODSttLa4+9gI6X8WQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tBgDv-00DLAF-1A; Thu, 14 Nov 2024 21:13:51 +0100
Date: Thu, 14 Nov 2024 21:13:51 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Russell King <linux@armlinux.org.uk>, jacob.e.keller@intel.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v2 8/8] dt-bindings: net: sparx5: document RGMII
 MAC delays
Message-ID: <29ddbe38-3aac-4518-b9f3-4d228de08360@lunn.ch>
References: <20241113-sparx5-lan969x-switch-driver-4-v2-0-0db98ac096d1@microchip.com>
 <20241113-sparx5-lan969x-switch-driver-4-v2-8-0db98ac096d1@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113-sparx5-lan969x-switch-driver-4-v2-8-0db98ac096d1@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_121404_518637_6DBD4BEF 
X-CRM114-Status: GOOD (  10.40  )
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

On Wed, Nov 13, 2024 at 10:11:16PM +0100, Daniel Machon wrote:
> The lan969x switch device supports two RGMII port interfaces that can be
> configured for MAC level rx and tx delays.
> 
> Document two new properties {rx,tx}-internal-delay-ps. Make them
> required properties, if the phy-mode is one of: rgmii, rgmii_id,
> rgmii-rxid or rgmii-txid. Also specify accepted values.

This is unusual if you look at other uses of {rt}x-internal-delay-ps.
It is generally an optional parameter, and states it defaults to 0 if
missing, and is ignored by the driver if phy-mode is not an rgmii
variant.

	Andrew

