Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9697C02187
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 01:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:In-Reply-To:References:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XDTAFof9Tp23KO2yXqU8O3LEJ0x+II1TkV7sz0LP/pc=; b=IBb4yKKyt71amAQQGzAWb9Zz+M
	uBo3D171v23II4ygWTwuAebZVaTyhaAnkABHHf55MTn1HP/cZhIl3wCPoJKMFPl+h0tTu7QGAGhBC
	SvwZVczk9fsyxNhLqbpTOV0GMt/9DdDE7xe6vGSuQkveTi7qna18G6kLn9lc7iBbJ0RnSfa9vVRqe
	rpa6PK8dlTu0kFqrnlTRDgd8S1Jk/1ynswam25y3LorxBGPH3CUV3a0qRtNzvcja/TdH24SPPA9J+
	/7MYxPrf+d3FK7PqCj7gcGWmQXoIpgHD+FAY5n2QtMkcdOzHBnv44WEc7XVy6QrPJg/R5/SlliNML
	qTXh/wvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZgzu-00000004YPv-0u2A;
	Mon, 20 Jan 2025 01:54:38 +0000
Received: from [54.206.34.216] (helo=smtpbgau2.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZgyZ-00000004YMW-1HOw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 01:53:20 +0000
X-QQ-mid: Yeas6t1737337890t616t23287
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [115.197.136.137])
X-QQ-SSF: 0000000000000000000000000000000
From: =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 10819580745422252476
To: "'Russell King \(Oracle\)'" <linux@armlinux.org.uk>
Cc: "'Andrew Lunn'" <andrew@lunn.ch>,
	"'Heiner Kallweit'" <hkallweit1@gmail.com>,
	<mengyuanlou@net-swift.com>,
	"'Alexandre Torgue'" <alexandre.torgue@foss.st.com>,
	"'Andrew Lunn'" <andrew+netdev@lunn.ch>,
	"'Bryan Whitehead'" <bryan.whitehead@microchip.com>,
	"'David S. Miller'" <davem@davemloft.net>,
	"'Eric Dumazet'" <edumazet@google.com>,
	"'Jakub Kicinski'" <kuba@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	"'Marcin Wojtas'" <marcin.s.wojtas@gmail.com>,
	"'Maxime Coquelin'" <mcoquelin.stm32@gmail.com>,
	<netdev@vger.kernel.org>,
	"'Paolo Abeni'" <pabeni@redhat.com>,
	<UNGLinuxDriver@microchip.com>
References: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk> <06d301db68bd$b59d3c90$20d7b5b0$@trustnetic.com> <Z4odUIWmYb8TelZS@shell.armlinux.org.uk> <06dc01db68c8$f5853fa0$e08fbee0$@trustnetic.com> <Z4pL3Mn6Qe7O45D7@shell.armlinux.org.uk>
In-Reply-To: <Z4pL3Mn6Qe7O45D7@shell.armlinux.org.uk>
Subject: RE: [PATCH net-next 0/9] net: add phylink managed EEE support
Date: Mon, 20 Jan 2025 09:51:29 +0800
Message-ID: <073a01db6add$d308af40$791a0dc0$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQJuuL6961zeRYLpn6fcQniPsxo8VAIOTZqlAVk2sswCDJNSGAGgOtUSsb+m6+A=
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OHTF91J1Rz8h0kIA3PzIWh1klyQYpF4NuBC0SsStFAkOcZJZBGzwpRRo
	pQJNIuPBcD/vHyzbDsSsRxY0jksoHe2rJ9Lvs2WTpajYdMtfyARRbQjDx2cT8J+YZVOCC8x
	kuBTyLpyTxjF5O/WmG1w9TK1NWS/XJD4KMdWFYNL3krlqLeLQBWd9xunkWxAC4mRFjAIPR9
	dRkCHogQAKczlkJyZG/G+L3JJRDa6fsqk3SMccx2FTd79ZafcatdHfqJsfN1sfYb9s/ejow
	tJK/G9aRgyroA+VlxVFRXhF4CyDtsxC+MbhIq/0vBa4IAAb/7j4c7NPkW7wA6S3Gntafrck
	qJaCBry3AL5UPpchd72wmhEhwbljB7V0DedPoZOeEiS0zKLHlqQf0owkQp/OQ73Oi7dKDWL
	sYYE3G1QiAGKiXgUzGwv5g9nXErHOG/H5x6IVGhxcQ2slI/WbJ9j3UxI8bwFe2BqhiR9PFH
	B2Bfc11Z/kDf0AlxcbapxsytP/tHthF1VpBwnDhtOMYBQa5q0uF7JffxJAT8Lx7RFPNel0m
	sTjMp7SDkli7zhCRlZWNOf3The4zmLIKDjSnCGR9vz2sVFjoPALPdYhzpP99EgEeiEW17K5
	XVFigWOpjSxMaKywm08JKQOLXvdHS6jt/2tV7HbplZws5YjYnEmBNu+t0PzpO/pGHMJB2/f
	dUXUIfp8awN0Jc5t+SBo6UzsAIbl9koY98ow8AymXOQt74gFO8Ldk2qbtqCTHJafLhwNxNe
	bNcSxSLS9RMPdVlYI8r0wqoWbcOCWZ6gnRr11uVOqnZ4fdFl+mSByIgeLK7+NqQjhit2cjX
	uRmmjVtk+JNHXzMncEcCKU+nLv0mWKQviQ4B8OAr9ommIgAVEG7wKmpxtzOoZRmJe/gi9Zg
	8RDbG35nx+rj4bG7shC3I4y9zx079bt5RJiVqcxYAAQ3YrQx1pv9YZMi7TLxfVWKBRWNjVH
	IbTUDDJBGIKc24qrdi2FFSninfM43rEBJcdq9wKIPmoJIBcwtq4aL+HhG
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_175315_739123_7825D4C5 
X-CRM114-Status: GOOD (  18.97  )
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

On Fri, Jan 17, 2025 8:24 PM, Russell King (Oracle) wrote:
> On Fri, Jan 17, 2025 at 06:17:05PM +0800, Jiawen Wu wrote:
> > > > Since merging these patches, phylink_connect_phy() can no longer be
> > > > invoked correctly in ngbe_open(). The error is returned from the function
> > > > phy_eee_rx_clock_stop(). Since EEE is not supported on our NGBE hardware.
> > >
> > > That would mean phy_modify_mmd() is failing, but the question is why
> > > that is. Please investigate. Thanks.
> >
> > Yes, phy_modify_mmd() returns -EOPNOTSUPP. Since .read/write_mmd are
> > implemented in the PHY driver, but it's not supported to read/write the
> > register field (devnum=MDIO_MMD_PCS, regnum= MDIO_CTRL1).
> >
> > So the error occurs on  __phy_read_mmd():
> > 	if (phydev->drv && phydev->drv->read_mmd)
> > 		return phydev->drv->read_mmd(phydev, devad, regnum);
> 
> Thanks. The patch below should fix it. Please test, meanwhile I'll
> prepare a proper patch.
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 66eea3f963d3..56d411bb2547 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -2268,7 +2268,11 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
>  	/* Explicitly configure whether the PHY is allowed to stop it's
>  	 * receive clock.
>  	 */
> -	return phy_eee_rx_clock_stop(phy, pl->config->eee_rx_clk_stop_enable);
> +	ret = phy_eee_rx_clock_stop(phy, pl->config->eee_rx_clk_stop_enable);
> +	if (ret == -EOPNOTSUPP)
> +		ret = 0;
> +
> +	return ret;
>  }
> 
>  static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,

Test pass.
Thanks.


