Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3CFE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Dec 2024 17:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvdB94uGuCDDuV6epOSyj5t+hu3BSU5GxftGA2HKkN8=; b=s74FfI/pXSMi+PXP/2TyMlhZ2s
	zuehWq4nk3dnU/pDHf529OaUG7IEGWc6D64LkHrVML5bhINEKxGG1D7F2EhpyBVDfskfaSHDcDVkB
	LYJLJnr2v+liODcuxJBZVVBEcu0qhp47d4o4i2JaSr8s4tmOnIMEV1wktin7bF2PawhI20rDz4ycz
	8MUFYysc0cucZvYUp/QYuplYTaDkPHag5cfUdQEWrhb8hRrP2YCQSEvmi6LcXfw7WAnYv0KN61E0P
	W5zJDY3taZ/D6upxCoe8q9z7wdP6higdZIKWrcBnH4K1M6c8710cYwK+94r0NnhBI2sS04/OZMbFM
	aVaWw3jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQVMC-0000000E947-0OqI;
	Wed, 25 Dec 2024 17:39:40 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQVKz-0000000E8xf-1Fvf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Dec 2024 17:38:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hvdB94uGuCDDuV6epOSyj5t+hu3BSU5GxftGA2HKkN8=; b=y6TFPv/QFV/2euxYDzjACJ+lfX
	4wWj+d17x+R3uO/CWPu8+vtFsTxKvShez12pG1jdB21OCavTShkwZXyQthYMLlbiDGC+7Aexi1Eg9
	9tEZGKslGYt3d1grb29EkB88MckIVtr9vvUGXOuMnoWHS3oJ1/88JIGPMy18515DCvJY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tQVKb-00G9ut-QF; Wed, 25 Dec 2024 18:38:01 +0100
Date: Wed, 25 Dec 2024 18:38:01 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcs615-ride: Enable RX
 programmable swap on qcs615-ride
Message-ID: <88bd11c6-e5f6-4c12-a009-5ec07fd1b873@lunn.ch>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
 <20241225-support_10m100m-v1-3-4b52ef48b488@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241225-support_10m100m-v1-3-4b52ef48b488@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_093825_351840_515FAC58 
X-CRM114-Status: GOOD (  15.19  )
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

On Wed, Dec 25, 2024 at 06:04:47PM +0800, Yijie Yang wrote:
> The timing of sampling at the RX side for qcs615-ride needs adjustment.
> It varies from board to board.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index bfb5de4a0d440efece993dbf7a0001e001d5469b..f22a4a0b247a09bd1057b66203a34b666cd119a8 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -206,6 +206,7 @@ &ethernet {
>  	phy-handle = <&rgmii_phy>;
>  	phy-mode = "rgmii";
>  	max-speed = <1000>;
> +	qcom,rx-prog-swap;

I notice this board still has messed up rgmii delays, using phy-mode =
"rgmii", not "rgmii-id". How does com,rx-prog-swap interact with rgmii
delays? Is the sample point logic before or after the rgmii delay
logic in the MAC clock pipeline?

I think i also questioned max-speed = <1000>. Has this
arch/arm64/boot/dts/qcom/qcs615-ride.dts been merged?

	Andrew

