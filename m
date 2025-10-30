Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518E5CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 10:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3J3PZ9sZgj309/9WKHqysIytic0WUh2G18+w7Qekg4=; b=DvATstz/fLRlfAWQQYciHrEkD/
	cRbZNwvoGQ3g92AFlVhTO3WiT+9l3RcyLejdhaFWo3WGOyPQGMhq//CLX6Zx0Noewdatx1dorHliV
	mouBbkAmhrW9jQipUwebxfso7R6jtQxR+P3Ag4nQplIq6dEJ5Ul5OR9HVjgfPkDUFq7fEGFvgtvuI
	J9oGYVGcAZ5HkbEsLdjirQb+Bm6h0QaQFWifnSkvvUPWwFwG48qbE39rXfueHux5U6q77+oR4ubOm
	Ogslqu9sf/DWQrgmNCcszz9PQfSHrQWLuSYtPVqkXBCf6gxClpYJsdMbmrIVC7aT/gGjLfRKLZFsM
	LKXK7CIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPiT-00000003xQK-0Djz;
	Thu, 30 Oct 2025 10:17:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPiQ-00000003xPh-2uOs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 10:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=T3J3PZ9sZgj309/9WKHqysIytic0WUh2G18+w7Qekg4=; b=IoRXrcFRaFvVL7yx4rn28Pyyv4
	/oxQjShGlkiqn1aLKuTSkN2WMdzHrB6Jn/g1UjHlhaI6PaVCV4aVvmsmf9akOkqZSDGgnrAx8pW7d
	9nxPzk0tkrG+qVZmfswvl3izhs8gUUClescS8svZhzsavm+XN4w744XdDNBF8NAIaAqSYC6JX5hdu
	jitqfBmXesDgPRHGOBomWxLLROXXjxShFPGN+yJhiKMTNNgacg7UeQzyTEA8I4oB+QuFKDcIXIwYf
	U6PepcdtlSl8QMJqPnNf23LO7lYCD8GfTMXkIioVp3oIqwmkZMV6Ah4TEp+lxyi4dCAmXzmDdpnZ4
	uX7rCuow==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60374)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vEPiG-000000005VC-3Ry1;
	Thu, 30 Oct 2025 10:17:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vEPiE-000000008NB-08sQ;
	Thu, 30 Oct 2025 10:16:58 +0000
Date: Thu, 30 Oct 2025 10:16:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
 modification
Message-ID: <aQM7GVhaK2fhckKF@shell.armlinux.org.uk>
References: <E1vE3GG-0000000CCuC-0ac9@rmk-PC.armlinux.org.uk>
 <7a774a6d-3f8f-4f77-9752-571eadd599bf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a774a6d-3f8f-4f77-9752-571eadd599bf@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_031710_742423_9FDCCF43 
X-CRM114-Status: GOOD (  12.79  )
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

On Thu, Oct 30, 2025 at 11:01:48AM +0100, Konrad Dybcio wrote:
> On 10/29/25 11:18 AM, Russell King (Oracle) wrote:
> > Whereas ethqos_configure_sgmii():
> > 2500: clears ETHQOS_MAC_CTRL_PORT_SEL           B14=X B15=0
> > 1000: clears ETHQOS_MAC_CTRL_PORT_SEL           B14=X B15=0
> > 100: sets ETHQOS_MAC_CTRL_PORT_SEL |            B14=1 B15=1
> >           ETHQOS_MAC_CTRL_SPEED_MODE
> > 10: sets ETHQOS_MAC_CTRL_PORT_SEL               B14=0 B15=1
> >     clears ETHQOS_MAC_CTRL_SPEED_MODE
> > 
> > Thus, they appear to be doing very similar, with the exception of the
> > FES bit (bit 14) for 1G and 2.5G speeds.
> 
> Without any additional knowledge, the register description says:
> 
> 2500: B14=1 B15=0
> 1000: B14=0 B15=0
>  100: B14=1 B15=1
>   10: B14=0 B15=1
> 
> (so the current state of this driver)
> 
> and it indeed seems to match the values set in dwmac4_setup()
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks Konrad. I've included an extract from your reply in the commit
description as well, thanks for referring back to the documentation.

Note that B14 is not explicitly configured by ethqos_configure_sgmii()
for 1G and 2.5G speeds which is a harmless bug in this glue driver,
and an additional reason to get rid of this code!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

