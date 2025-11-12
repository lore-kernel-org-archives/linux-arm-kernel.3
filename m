Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 220ECCD13DF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 16:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Xm3Jqg8+2+w93tYfaelw64xlHAeRO0zvEeZG7tD2rY=; b=lHjqcFnS7I7W5LaWr5ywZzWnah
	O7KE+0Qu9nqP3y6Q+yJ266AcdMNRk+VZnNtTFujF4zcMB7pVbpfcaAI1iU0eEl+1XEiqIKkN0n1Zq
	KCFcfqAuZ8Sin3tv0LIkjiX+VqnovH+nfgVTRRpVzLSirqgwjLPYVbl7AtpAuLq9BsIMbBrlQAK0v
	MkmOVXFgiaJgcd1V119rELH3OdrbFH6sp9UICcWO2wYgl1HsiW3Gf69pZXzZKlOL4p94Kfiv3Effm
	/UnqNDcNQS/pSS9Fldo954F0HLHGJybjy5mR9NMzeuni8iT5QnoafSf73oP+KCUg4KLq39mVC+A6u
	vuZRWNzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDUA-00000009A68-40jn;
	Wed, 12 Nov 2025 16:14:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDU8-00000009A5V-1LoF;
	Wed, 12 Nov 2025 16:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0Xm3Jqg8+2+w93tYfaelw64xlHAeRO0zvEeZG7tD2rY=; b=G+dKewrSVXrUAZuM5F125UT8S5
	zaHU7+ocovD/gn4fA6+EswWdZMrDTfbsrTbw14r2Cor1QHzNQcTISEZrJU2WYmMx2qLZD/NEqUPY5
	yPHLkyR4lNokoGZeE6gktrisq9jHWTzYdm5MvpLaRmNbCWzXFBv3JnyQPZ0Xy9Y4eZs6qk/vvkvjc
	0WRVop6jos4sjQmhwoxYumOKXVIqoWSrofKP0mAUZCVzPzOoXBynk8TANECztvxeaL6oDqRs1hknl
	jmow3HcEIXe3rV4TamzKI1JBGpTwwrGJIBIvM0ONW3KgFDI6FuEYaTFy/RzBULsxsCYhvmKS86jUx
	uq7cHWIw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56664)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vJDU0-000000004Dt-3Opf;
	Wed, 12 Nov 2025 16:14:08 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vJDTy-0000000041V-0hAR;
	Wed, 12 Nov 2025 16:14:06 +0000
Date: Wed, 12 Nov 2025 16:14:06 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
	William Mcvicker <willmcvicker@google.com>,
	Manivannan Sadhasivam <mani@kernel.org>, neil.armstrong@linaro.org
Subject: Re: [PATCH v4 1/2] phy: add new phy_notify_state() api
Message-ID: <aRSyTst8Vd-Qb2Ha@shell.armlinux.org.uk>
References: <20251112-phy-notify-pmstate-v4-0-717d78009d15@linaro.org>
 <20251112-phy-notify-pmstate-v4-1-717d78009d15@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-phy-notify-pmstate-v4-1-717d78009d15@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_081416_363560_E6FDCDCC 
X-CRM114-Status: UNSURE (   7.82  )
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

On Wed, Nov 12, 2025 at 04:05:58PM +0000, Peter Griffin wrote:
> +int phy_notify_state(struct phy *phy, union phy_notify state)
...
> @@ -255,6 +266,7 @@ int phy_reset(struct phy *phy);
>  int phy_calibrate(struct phy *phy);
>  int phy_notify_connect(struct phy *phy, int port);
>  int phy_notify_disconnect(struct phy *phy, int port);
> +int phy_notify_state(struct phy *phy, union phy_notify state);
>  static inline int phy_get_bus_width(struct phy *phy)
>  {
>  	return phy->attrs.bus_width;
> @@ -412,6 +424,13 @@ static inline int phy_notify_disconnect(struct phy *phy, int index)
>  	return -ENOSYS;
>  }
>  
> +static inline int phy_notify_phystate(struct phy *phy, union phy_notify state)

Should this be phy_notify_state() ?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

