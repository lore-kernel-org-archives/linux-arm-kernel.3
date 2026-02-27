Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EC6FEFB4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 13:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wGSUswD92EwB+WQlJmO+9tPWxRxgLk2HLaN27CrVig=; b=a4sM9s9yNKgvTBdeSco2xnRsN4
	K4AVSad1dYtY/Ep/WEW16DUCWSVQrtHu5Wh0XdnNc3ryLG7z0eLiEAqIbAIU07ezNcd1UVHfwyIWh
	dzs1aATKsPTdP0PUCtz5XIzRDpYD0ZLmO0cX/oMv4NBiBtxtVM4m8W0hRFVTGYpCYdqJ1m34bt3Bx
	YQTbAbgZx4CXQL5pzQ9fBYRIGtGby/EV9mjo+Dwma4wY69Wuj4guuh30z5jjjNVecwVPhGB3SVYsR
	qwNSAdSz39+Iu4smb4d0JooNK6pnUIzILKqPvffbTdAdHjDIddvfZerx0edE7ZLWZWvt7ABvxqR5o
	LhWR/cnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvy9v-00000008OZo-2Mk1;
	Fri, 27 Feb 2026 13:45:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvy9t-00000008OZP-1mjI;
	Fri, 27 Feb 2026 13:45:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 117FF417C2;
	Fri, 27 Feb 2026 13:45:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DCC6C19423;
	Fri, 27 Feb 2026 13:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772199932;
	bh=SKsV8ym5l/huOSjTYD/pCQkRyet275DwzWDj6sr4VYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fjt4tYvDR3Yx46omuqjFG/bP3S/ZkDcwA2EJwv61oGtfT0Bfc7PBUxj8yF++zs6aw
	 GiCbJvrwSh4SEWXhkxmJenmX0SkCBEjBznUN/4+Rq/Yu7NhDPM9kjNbwldG5P4dvNO
	 WP3mzZ58bIN5Qjq9cV69tV7BvWokRIMD9p0QAKdqpidIjPyt+KsE+lFTYsTgxZDAoK
	 WkXOidUZrr6/uaaSU201eEUspAtbGCcT27rlVfOcK7vNSjMJrOOFK4xd8gyeLLCP3B
	 M0/g9WSR6Wf03IKI9ohI0JZc0W26dFpA5qtldoljrQZVH2cJI5xKLaHFEWFsMTQQtb
	 4viCazY7YBPnQ==
Date: Fri, 27 Feb 2026 19:15:29 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 6/8] phy: qcom-sgmii-eth: remove
 qcom_dwmac_sgmii_phy_interface()
Message-ID: <aaGf-RN9Hho8qEdx@vaman>
References: <aZ66OT9scKipRRu2@shell.armlinux.org.uk>
 <E1vvCc9-0000000ArLG-0if1@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vvCc9-0000000ArLG-0if1@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_054533_482848_11067071 
X-CRM114-Status: UNSURE (   5.99  )
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

On 25-02-26, 10:59, Russell King (Oracle) wrote:
> Now that qcom_dwmac_sgmii_phy_interface() only serves to validate the
> passed interface mode, combine it with qcom_dwmac_sgmii_phy_validate(),
> and use qcom_dwmac_sgmii_phy_validate() to validate the mode in
> qcom_dwmac_sgmii_phy_set_mode().
> 
> Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

