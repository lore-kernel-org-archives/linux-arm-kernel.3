Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00ED1C54E65
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 09:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAjgU5AeI3GGoAqQg1Ay/7K2c9xp6xe7zxXbRlO6SgE=; b=vNUgkF42hSYwD1TYw+MmMLgUkw
	oy2/t9eLMFjXbXQ/p3mPkTcEgeb9iYoojEy2AlGBvDT+sPzTaB/2X13eGBXjStFQSwYWKUroRzsw/
	uMvWr7OsDPvoTDWAe534ud75SssAWTb7AMLE/vlozC8KTcKlGKAeMlDk6TKmou9GFZXz0ZIzI043C
	lPLfHEf2LzIT/ylnZS37yFwbGVkQ/FpLMeLXfBl+ByYyUGmUjseq/omimW63sdxrZrK6SINs7hGBu
	rA6h52ybfnZQPNLy6JBjGjYBzlM4XI0Wk0ZYth8mFgqe9trL1j8g+Z4mByOoAtHmRLt5xJamYMM1n
	v1wQPN0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI26j-00000000TEq-26KX;
	Thu, 22 May 2025 09:20:57 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI24d-00000000Sij-1Izu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 09:18:48 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uI24X-0006mJ-AF; Thu, 22 May 2025 11:18:41 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uI24W-000iBj-0K;
	Thu, 22 May 2025 11:18:40 +0200
Received: from pengutronix.de (unknown [IPv6:2a03:2260:2009:2000::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 292FD417605;
	Thu, 22 May 2025 09:18:39 +0000 (UTC)
Date: Thu, 22 May 2025 11:18:38 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: kernel@pengutronix.de, mailhol.vincent@wanadoo.fr, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, cl@rock-chips.com, 
	kever.yang@rock-chips.com, linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/3] net: can: rockchip: add can for RK3576 Soc
Message-ID: <20250522-axiomatic-tench-of-resistance-d7dc74-mkl@pengutronix.de>
References: <20250522074616.3115348-1-zhangqing@rock-chips.com>
 <20250522074616.3115348-3-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j7srovzofhhegkby"
Content-Disposition: inline
In-Reply-To: <20250522074616.3115348-3-zhangqing@rock-chips.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_021847_652400_12E485B6 
X-CRM114-Status: GOOD (  15.64  )
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


--j7srovzofhhegkby
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/3] net: can: rockchip: add can for RK3576 Soc
MIME-Version: 1.0

Hello Elaine Zhang,

I think this is a step in into the right direction. Looking at the .h
file only for now.

regards,
Marc

On 22.05.2025 15:46:15, Elaine Zhang wrote:
> Is new controller:
> Support CAN and CANFD protocol.
> Support Dma.
>=20
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>

[...]

> diff --git a/drivers/net/can/rockchip/rockchip_canfd.h b/drivers/net/can/=
rockchip/rockchip_canfd.h
> index 93131c7d7f54..17ee90850be4 100644
> --- a/drivers/net/can/rockchip/rockchip_canfd.h
> +++ b/drivers/net/can/rockchip/rockchip_canfd.h
> @@ -19,6 +19,8 @@
>  #include <linux/types.h>
>  #include <linux/u64_stats_sync.h>
>  #include <linux/units.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/dmaengine.h>

please sort alphabetically

>  #define RKCANFD_REG_MODE 0x000
>  #define RKCANFD_REG_MODE_CAN_FD_MODE_ENABLE BIT(15)
> @@ -287,6 +289,285 @@
>  #define RKCANFD_REG_RX_FIFO_RDATA 0x400
>  #define RKCANFD_REG_TXE_FIFO_RDATA 0x500
> =20
> +#define RK3576CANFD_REG_MODE 0x000
> +#define RK3576CANFD_REG_CMD 0x004
> +
> +#define RK3576CANFD_REG_STATE 0x008
> +#define RK3576CANFD_REG_STATE_SLEEP_STATE BIT(5)
> +#define RK3576CANFD_REG_STATE_BUS_OFF_STATE BIT(4)
> +#define RK3576CANFD_REG_STATE_ERROR_WARNING_STATE BIT(3)
> +#define RK3576CANFD_REG_STATE_TX_PERIOD BIT(2)
> +#define RK3576CANFD_REG_STATE_RX_PERIOD BIT(1)
> +#define RK3576CANFD_REG_STATE_TX_BUFFER_FULL BIT(0)
> +
> +#define RK3576CANFD_REG_INT 0x00c
> +#define RK3576CANFD_REG_INT_BUSOFF_RCY_INT BIT(19)
> +#define RK3576CANFD_REG_INT_ESM_WTM_INT BIT(18)
> +#define RK3576CANFD_REG_INT_ISM_WTM_INT BIT(17)
> +#define RK3576CANFD_REG_INT_BUSINT_INT BIT(16)
> +#define RK3576CANFD_REG_INT_RXSTR_TIMEOUT_INT BIT(15)
> +#define RK3576CANFD_REG_INT_MFI_TIMEOUT_INT BIT(14)
> +#define RK3576CANFD_REG_INT_MFI_INT BIT(13)
> +#define RK3576CANFD_REG_INT_AUTO_RETX_FAIL_INT BIT(12)
> +#define RK3576CANFD_REG_INT_WAKEUP_INT BIT(11)
> +#define RK3576CANFD_REG_INT_BUS_OFF_RECOVERY_INT BIT(10)
> +#define RK3576CANFD_REG_INT_BUS_OFF_INT BIT(9)
> +#define RK3576CANFD_REG_INT_RX_FIFO_OVERFLOW_INT BIT(8)
> +#define RK3576CANFD_REG_INT_RX_FIFO_FULL_INT BIT(7)
> +#define RK3576CANFD_REG_INT_ERROR_INT BIT(6)
> +#define RK3576CANFD_REG_INT_TX_ARBIT_FAIL_INT BIT(5)
> +#define RK3576CANFD_REG_INT_PASSIVE_ERROR_INT BIT(4)
> +#define RK3576CANFD_REG_INT_OVERLOAD_INT BIT(3)
> +#define RK3576CANFD_REG_INT_ERROR_WARNING_INT BIT(2)
> +#define RK3576CANFD_REG_INT_TX_FINISH_INT BIT(1)
> +#define RK3576CANFD_REG_INT_RX_FINISH_INT BIT(0)
> +
> +#define RK3576CANFD_REG_INT_ALL \
> +	(RK3576CANFD_REG_INT_BUSOFF_RCY_INT | \
> +	 RK3576CANFD_REG_INT_ESM_WTM_INT | \
> +	 RK3576CANFD_REG_INT_ISM_WTM_INT | \
> +	 RK3576CANFD_REG_INT_BUSINT_INT | \
> +	 RK3576CANFD_REG_INT_RXSTR_TIMEOUT_INT | \
> +	 RK3576CANFD_REG_INT_MFI_TIMEOUT_INT | \
> +	 RK3576CANFD_REG_INT_MFI_INT | \
> +	 RK3576CANFD_REG_INT_AUTO_RETX_FAIL_INT | \
> +	 RK3576CANFD_REG_INT_WAKEUP_INT | \
> +	 RK3576CANFD_REG_INT_BUS_OFF_RECOVERY_INT | \
> +	 RK3576CANFD_REG_INT_BUS_OFF_INT | \
> +	 RK3576CANFD_REG_INT_RX_FIFO_OVERFLOW_INT | \
> +	 RK3576CANFD_REG_INT_RX_FIFO_FULL_INT | \
> +	 RK3576CANFD_REG_INT_ERROR_INT | \
> +	 RK3576CANFD_REG_INT_TX_ARBIT_FAIL_INT | \
> +	 RK3576CANFD_REG_INT_PASSIVE_ERROR_INT | \
> +	 RK3576CANFD_REG_INT_OVERLOAD_INT | \
> +	 RK3576CANFD_REG_INT_ERROR_WARNING_INT | \
> +	 RK3576CANFD_REG_INT_TX_FINISH_INT | \
> +	 RK3576CANFD_REG_INT_RX_FINISH_INT)
> +
> +#define RK3576CANFD_REG_INT_ALL_ERROR \
> +	(RK3576CANFD_REG_INT_BUS_OFF_INT | \
> +	 RK3576CANFD_REG_INT_ERROR_INT | \
> +	 RK3576CANFD_REG_INT_PASSIVE_ERROR_INT | \
> +	 RK3576CANFD_REG_INT_ERROR_WARNING_INT)
> +
> +#define RK3576CANFD_REG_INT_MASK 0x010
> +
> +#define RK3576CANFD_REG_FD_NOMINAL_BITTIMING 0x100
> +#define RK3576CANFD_REG_FD_NOMINAL_BITTIMING_SAMPLE_MODE BIT(31)
> +#define RK3576CANFD_REG_FD_NOMINAL_BITTIMING_SJW GENMASK(30, 24)
> +#define RK3576CANFD_REG_FD_NOMINAL_BITTIMING_BRP GENMASK(23, 16)
> +#define RK3576CANFD_REG_FD_NOMINAL_BITTIMING_TSEG2 GENMASK(14, 8)
> +#define RK3576CANFD_REG_FD_NOMINAL_BITTIMING_TSEG1 GENMASK(7, 0)
> +
> +#define RK3576CANFD_REG_FD_DATA_BITTIMING 0x104
> +#define RK3576CANFD_REG_FD_DATA_BITTIMING_BRS_TSEG1 GENMASK(31, 24)
> +#define RK3576CANFD_REG_FD_DATA_BITTIMING_BRS_MODE BIT(23)
> +#define RK3576CANFD_REG_FD_DATA_BITTIMING_ACKSLOT_SYNC_DIS BIT(22)
> +#define RK3576CANFD_REG_FD_DATA_BITTIMING_SJW GENMASK(20, 17)
> +#define RK3576CANFD_REG_FD_DATA_BITTIMING_BRP GENMASK(16, 9)
> +#define RK3576CANFD_REG_FD_DATA_BITTIMING_TSEG2 GENMASK(8, 5)
> +#define RK3576CANFD_REG_FD_DATA_BITTIMING_TSEG1 GENMASK(4, 0)
> +
> +#define RK3576CANFD_REG_TRANSMIT_DELAY_COMPENSATION 0x108
> +#define RK3576CANFD_REG_TRANSMIT_DELAY_COMPENSATION_TDC_OFFSET GENMASK(6=
, 1)
> +#define RK3576CANFD_REG_TRANSMIT_DELAY_COMPENSATION_TDC_ENABLE BIT(0)
> +
> +#define RK3576CANFD_REG_BRS_CFG 0x10c
> +#define RK3576CANFD_REG_BRS_CFG_TRIPLE_SYNC_MODE BIT(31)
> +#define RK3576CANFD_REG_BRS_CFG_SP2_DTSEG1 GENMASK(30, 26)
> +#define RK3576CANFD_REG_BRS_CFG_SP2_NTSEG1 GENMASK(25, 18)
> +#define RK3576CANFD_REG_BRS_CFG_SP1_DTSEG1 GENMASK(17, 13)
> +#define RK3576CANFD_REG_BRS_CFG_SP1_NTSEG1 GENMASK(12, 5)
> +#define RK3576CANFD_REG_BRS_CFG_RESYNC_MODE BIT(3)
> +#define RK3576CANFD_REG_BRS_CFG_BRS_POSSYNC_EN BIT(1)
> +#define RK3576CANFD_REG_BRS_CFG_BRS_NEGSYNC_EN BIT(0)
> +
> +#define RK3576CANFD_REG_LOOP_CNT 0x110
> +
> +#define RK3576CANFD_REG_DMA_CTRL 0x11c
> +#define RK3576CANFD_REG_DMA_CTRL_DMA_RX_EN BIT(9)
> +#define RK3576CANFD_REG_DMA_CTRL_DMA_THR GENMASK(8, 0)
> +
> +#define RK3576CANFD_REG_FD_TXFRAMEINFO 0x200
> +
> +#define RK3576CANFD_REG_FD_TXID 0x204
> +#define RK3576CANFD_REG_FD_ID_EFF GENMASK(28, 0)
> +#define RK3576CANFD_REG_FD_ID_SFF GENMASK(11, 0)
> +
> +#define RK3576CANFD_REG_FD_TXDATA0 0x208
> +#define RK3576CANFD_REG_FD_TXDATA1 0x20c
> +#define RK3576CANFD_REG_FD_TXDATA2 0x210
> +#define RK3576CANFD_REG_FD_TXDATA3 0x214
> +#define RK3576CANFD_REG_FD_TXDATA4 0x218
> +#define RK3576CANFD_REG_FD_TXDATA5 0x21c
> +#define RK3576CANFD_REG_FD_TXDATA6 0x220
> +#define RK3576CANFD_REG_FD_TXDATA7 0x224
> +#define RK3576CANFD_REG_FD_TXDATA8 0x228
> +#define RK3576CANFD_REG_FD_TXDATA9 0x22c
> +#define RK3576CANFD_REG_FD_TXDATA10 0x230
> +#define RK3576CANFD_REG_FD_TXDATA11 0x234
> +#define RK3576CANFD_REG_FD_TXDATA12 0x238
> +#define RK3576CANFD_REG_FD_TXDATA13 0x23c
> +#define RK3576CANFD_REG_FD_TXDATA14 0x240
> +#define RK3576CANFD_REG_FD_TXDATA15 0x244
> +
> +#define RK3576CANFD_REG_RXFRD 0x400
> +#define RK3576CANFD_REG_RXFRD_FRAMEINFO_FRAME_FORMAT BIT(23)
> +#define RK3576CANFD_REG_RXFRD_FRAMEINFO_RTR BIT(22)
> +#define RK3576CANFD_REG_RXFRD_FRAMEINFO_FDF BIT(21)
> +#define RK3576CANFD_REG_RXFRD_FRAMEINFO_BRS BIT(20)
> +#define RK3576CANFD_REG_RXFRD_FRAMEINFO_DATA_LENGTH GENMASK(27, 24)
> +
> +#define RK3576CANFD_REG_STR_CTL 0x600
> +#define RK3576CANFD_REG_STR_STATE 0x604
> +#define RK3576CANFD_REG_INTM_FRAME_CNT GENMASK(25, 17)
> +#define RK3576CANFD_REG_INTM_LEFT_CNT GENMASK(16, 8)
> +#define RK3576CANFD_REG_INTM_LEFT_CNT_SHIFT 8
> +
> +#define RK3576CANFD_REG_STR_TIMEOUT 0x608
> +
> +#define RK3576CANFD_BUFFER_MODE_ENABLE BIT(0)

Please follow the established naming for the macros
RK3576CANFD_REG_<REG_NAME>_<BITS_NAME>.

> +#define RK3576CANFD_EXT_STORAGE_MODE BIT(1)
> +#define RK3576CANFD_ISM_SEL_SHIFT 2

Please remove the SHIFT, use FIELD_GET(), FIELD_PREP()

> +#define RK3576CANFD_ISM_SEL_MASK (0x3 << RK3576CANFD_ISM_SEL_SHIFT)

Please use GENMASK() and remove _MASK from the macro name. Same applies
to the following.

> +#define RK3576CANFD_RX_STORAGE_RESET BIT(4)
> +#define RK3576CANFD_ESM_SEL_SHIFT 6
> +#define RK3576CANFD_ESM_SEL_MASK (0x3 << RK3576CANFD_ESM_SEL_SHIFT)
> +#define RK3576CANFD_STORAGE_TIMEOUT_MODE BIT(8)
> +
> +#define RK3576CANFD_INTM_CNT_SHIFT 17
> +#define RK3576CANFD_INTM_CNT_MASK (0x1ff << RK3576CANFD_INTM_CNT_SHIFT)
> +#define RK3576CANFD_INTM_LEFT_CNT_SHIFT 8
> +#define RK3576CANFD_INTM_LEFT_CNT_MASK (0x1ff << RK3576CANFD_INTM_LEFT_C=
NT_SHIFT)
> +#define RK3576CANFD_EXTM_FULL BIT(3)
> +#define RK3576CANFD_EXTM_EMPTY BIT(2)
> +#define RK3576CANFD_INTM_FULL BIT(1)
> +#define RK3576CANFD_INTM_EMPTY BIT(0)
> +
> +#define RK3576CANFD_REG_STR_WTM 0x60c
> +#define RK3576CANFD_REG_ATF0 0x700
> +#define RK3576CANFD_REG_ATF1 0x704
> +#define RK3576CANFD_REG_ATF2 0x708
> +#define RK3576CANFD_REG_ATF3 0x70c
> +#define RK3576CANFD_REG_ATF4 0x710
> +#define RK3576CANFD_REG_ATFM0 0x714
> +#define RK3576CANFD_REG_ATFM1 0x718
> +#define RK3576CANFD_REG_ATFM2 0x71c
> +#define RK3576CANFD_REG_ATFM3 0x720
> +#define RK3576CANFD_REG_ATFM4 0x724
> +#define RK3576CANFD_REG_ATF_DLC 0x728
> +#define RK3576CANFD_REG_ATF_CTL 0x72c
> +#define RK3576CANFD_ATF_MASK BIT(31)
> +#define RK3576CANFD_ATF_RTR_EN BIT(30)
> +#define RK3576CANFD_ATF_RTR BIT(29)
> +#define RK3576CANFD_ATF_DLC_MODE BIT(5)
> +#define RK3576CANFD_ATF_DLC_EN BIT(4)
> +#define RK3576CANFD_ATF_DLC_SHIFT 0
> +#define RK3576CANFD_ATF_DLC_MASK (0xf << RK3576CANFD_ATF_DLC_SHIFT)
> +#define RK3576CANFD_ATF_DIS(n) BIT(n)
> +
> +#define RK3576CANFD_REG_SPACE_CTRL 0x800
> +
> +#define RK3576CANFD_REG_AUTO_RETX_CFG 0x808
> +#define RK3576CANFD_RETX_TIME_LIMIT_CNT 0x12c /* 300 */
> +#define RK3576CANFD_RETX_TIME_LIMIT_SHIFT 3
> +#define RK3576CANFD_RETX_TIME_LIMIT_CNT_MAX 0xffff
> +#define RK3576CANFD_RETX_LIMIT_EN BIT(1)
> +#define RK3576CANFD_AUTO_RETX_EN BIT(0)
> +
> +#define RK3576CANFD_REG_AUTO_RETX_STATE0 0x80c
> +#define RK3576CANFD_REG_AUTO_RETX_STATE1 0x810
> +#define RK3576CANFD_REG_OLF_CFG 0x814
> +#define RK3576CANFD_REG_RXINT_CTRL 0x818
> +#define RK3576CANFD_REG_RXINT_TIMEOUT 0x81c
> +#define RK3576CANFD_REG_OTHER_CFG 0x820
> +#define RK3576CANFD_REG_WAVE_FILTER_CFG 0x824
> +#define RK3576CANFD_REG_RBC_CFG 0x828
> +#define RK3576CANFD_REG_TXCRC_CFG 0x82c
> +
> +#define RK3576CANFD_REG_BUSOFFRCY_CFG 0x830
> +#define RK3576CANFD_REG_BUSOFF_RCY_THR 0x834
> +#define RK3576CANFD_BUSOFF_RCY_MODE_EN BIT(8)
> +#define RK3576CANFD_BUSOFF_RCY_TIME_CLR BIT(9)
> +#define RK3576CANFD_BUSOFF_RCY_CNT_FAST 4
> +#define RK3576CANFD_BUSOFF_RCY_CNT_SLOW 5
> +#define RK3576CANFD_BUSOFF_RCY_TIME_FAST 0x3d0900 /* 40ms : cnt * (1 / c=
an_clk) */
> +#define RK3576CANFD_BUSOFF_RCY_TIME_SLOW 0x1312d00 /* 200ms : cnt * (1 /=
 can_clk) */

Don't consider can_clk fixed.

> +#define RK3576CANFD_REG_ERROR_CODE 0x900
> +#define RK3576CANFD_REG_ERROR_MASK 0x904
> +#define RK3576CANFD_ACK_ERROR_MASK BIT(4)
> +#define RK3576CANFD_FORM_ERROR_MASK BIT(3)
> +#define RK3576CANFD_CRC_ERROR_MASK BIT(2)
> +#define RK3576CANFD_STUFF_ERROR_MASK BIT(1)
> +#define RK3576CANFD_BIT_ERROR_MASK BIT(0)
> +
> +#define RK3576CANFD_REG_RXERRORCNT 0x910
> +#define RK3576CANFD_REG_TXERRORCNT 0x914
> +#define RK3576CANFD_REG_RX_RXSRAM_RDATA 0xc00
> +#define RK3576CANFD_REG_RTL_VERSION 0xf0c
> +
> +#define RK3576CANFD_REG_ERROR_CODE_PHASE BIT(29)
> +#define RK3576CANFD_REG_ERROR_CODE_TYPE GENMASK(28, 26)
> +#define RK3576CANFD_REG_ERROR_CODE_TYPE_BIT 0x0
> +#define RK3576CANFD_REG_ERROR_CODE_TYPE_STUFF 0x1
> +#define RK3576CANFD_REG_ERROR_CODE_TYPE_FORM 0x2
> +#define RK3576CANFD_REG_ERROR_CODE_TYPE_ACK 0x3
> +#define RK3576CANFD_REG_ERROR_CODE_TYPE_CRC 0x4
> +#define RK3576CANFD_REG_ERROR_CODE_DIRECTION_RX BIT(25)
> +#define RK3576CANFD_REG_ERROR_CODE_TX GENMASK(24, 19)
> +#define RK3576CANFD_REG_ERROR_CODE_TX_ACK_EOF BIT(24)
> +#define RK3576CANFD_REG_ERROR_CODE_TX_CRC BIT(23)
> +#define RK3576CANFD_REG_ERROR_CODE_TX_STUFF_COUNT BIT(22)
> +#define RK3576CANFD_REG_ERROR_CODE_TX_DATA BIT(21)
> +#define RK3576CANFD_REG_ERROR_CODE_TX_SOF_DLC BIT(20)
> +#define RK3576CANFD_REG_ERROR_CODE_TX_IDLE BIT(19)
> +#define RK3576CANFD_REG_ERROR_CODE_RX GENMASK(18, 0)
> +#define RK3576CANFD_REG_ERROR_CODE_RX_ERROR BIT(18)
> +#define RK3576CANFD_REG_ERROR_CODE_RX_OVERLOAD BIT(17)
> +#define RK3576CANFD_REG_ERROR_CODE_RX_SPACE BIT(16)
> +#define RK3576CANFD_REG_ERROR_CODE_RX_EOF BIT(15)
> +#define RK3576CANFD_REG_ERROR_CODE_RX_ACK_LIM BIT(14)
> +#define RK3576CANFD_REG_ERROR_CODE_RX_ACK BIT(13)
> +#define RK3576CANFD_REG_ERROR_CODE_RX_CRC_LIM BIT(12)
> +#define RK3576CANFD_REG_ERROR_CODE_RX_CRC BIT(11)
> +#define RK3576CANFD_REG_ERROR_CODE_RX_STUFF_COUNT BIT(10)
> +#define RK3576CANFD_REG_ERROR_CODE_RX_DATA BIT(9)
> +#define RK3576CANFD_REG_ERROR_CODE_RX_DLC BIT(8)
> +#define RK3576CANFD_REG_ERROR_CODE_RX_BRS_ESI BIT(7)
> +#define RK3576CANFD_REG_ERROR_CODE_RX_RES BIT(6)
> +#define RK3576CANFD_REG_ERROR_CODE_RX_FDF BIT(5)
> +#define RK3576CANFD_REG_ERROR_CODE_RX_ID2_RTR BIT(4)
> +#define RK3576CANFD_REG_ERROR_CODE_RX_SOF_IDE BIT(3)
> +#define RK3576CANFD_REG_ERROR_CODE_RX_BUS_IDLE BIT(2)
> +#define RK3576CANFD_REG_ERROR_CODE_RX_BUS_INT BIT(1)
> +#define RK3576CANFD_REG_ERROR_CODE_RX_STOP BIT(0)
> +
> +#define RK3576CANFD_ISM_WATERMASK_CAN 0x6c /* word */
> +#define RK3576CANFD_ISM_WATERMASK_CANFD 0x6c /* word */
> +#define RK3576CANFD_ESM_WATERMASK (0x50 << 8) /* word */
> +
> +#define RK3576CANFD_SRAM_MAX_DEPTH 256 /* word */
> +#define RK3576CANFD_EXT_MEM_SIZE 0x2000 /* 8KByte */
> +
> +#define RK3576CANFD_CANFD_FILTER_MASK 0x1fffffff
> +
> +#define RK3576CANFD_CANFD_FIFO_CNT_MASK 0xff
> +
> +#define RK3576CANFD_CANBUSOFF_RCY_SLOW 200 /* ms */
> +#define RK3576CANFD_CANBUSOFF_RCY_FAST 30 /* ms */

Please add _MS to the macro names

> +
> +enum rk3576canfd_atf_mode {
> +	RK3576CANFD_ATF_MASK_MODE =3D 0,
> +	RK3576CANFD_ATF_LIST_MODE,
> +};

Why is this an enum? Please move it to the respective register. Same for
enum rk3576canfd_storage_mode.

> +enum rk3576canfd_storage_mode {
> +	RK3576CANFD_DATA_FLEXIBLE =3D 0,
> +	RK3576CANFD_DATA_CAN_FIXED,
> +	RK3576CANFD_DATA_CANFD_FIXED,
> +};
> +
>  #define DEVICE_NAME "rockchip_canfd"
>  #define RKCANFD_NAPI_WEIGHT 32
>  #define RKCANFD_TXFIFO_DEPTH 2
> @@ -434,11 +715,23 @@
>  enum rkcanfd_model {
>  	RKCANFD_MODEL_RK3568V2 =3D 0x35682,
>  	RKCANFD_MODEL_RK3568V3 =3D 0x35683,
> +	RKCANFD_MODEL_RK3576 =3D 0x3576,
>  };
> =20
> +static struct rkcanfd_priv *priv;
> +
>  struct rkcanfd_devtype_data {
>  	enum rkcanfd_model model;
>  	u32 quirks;
> +	void (*get_berr_counter)(struct rkcanfd_priv *priv, struct can_berr_cou=
nter *bec);
> +	void (*interrupts_enable)(const struct rkcanfd_priv *priv);
> +	void (*interrupts_disable)(const struct rkcanfd_priv *priv);
> +	void (*fifo_setup)(struct rkcanfd_priv *priv);
> +	void (*chip_start)(struct rkcanfd_priv *priv);
> +	void (*chip_stop)(struct rkcanfd_priv *priv, const enum can_state state=
);
> +	void (*chip_stop_sync)(struct rkcanfd_priv *priv, const enum can_state =
state);
> +	irqreturn_t (*irq)(int irq, void *dev_id);
> +	void (*register_done)(const struct rkcanfd_priv *priv);
>  };
> =20
>  struct rkcanfd_fifo_header {
> @@ -447,6 +740,11 @@ struct rkcanfd_fifo_header {
>  	u32 ts;
>  };
> =20
> +struct rk3576canfd_fifo_header {
> +	u32 frameinfo;
> +	u32 id;
> +};
> +
>  struct rkcanfd_stats {
>  	struct u64_stats_sync syncp;
> =20
> @@ -461,6 +759,7 @@ struct rkcanfd_priv {
>  	struct can_priv can;
>  	struct can_rx_offload offload;
>  	struct net_device *ndev;
> +	struct device *dev;
> =20
>  	void __iomem *regs;
>  	unsigned int tx_head;
> @@ -482,6 +781,17 @@ struct rkcanfd_priv {
>  	struct reset_control *reset;
>  	struct clk_bulk_data *clks;
>  	int clks_num;
> +	int rx_fifo_depth;
> +	int rx_max_data;
> +	unsigned int auto_retx_cnt;
> +	bool use_dma;
> +	u32 dma_size;
> +	u32 dma_thr;
> +	int quota;
> +	struct dma_chan *rxchan;
> +	u32 *rxbuf;
> +	dma_addr_t rx_dma_src_addr;
> +	dma_addr_t rx_dma_dst_addr;
>  };
> =20
>  static inline u32
> @@ -536,6 +846,8 @@ rkcanfd_get_tx_free(const struct rkcanfd_priv *priv)
>  void rkcanfd_ethtool_init(struct rkcanfd_priv *priv);
> =20
>  int rkcanfd_handle_rx_int(struct rkcanfd_priv *priv);
> +int rkcanfd_handle_rk3576_tx_int(struct rkcanfd_priv *priv);
> +int rkcanfd_handle_rk3576_rx_int(struct rkcanfd_priv *priv);
> =20
>  void rkcanfd_skb_set_timestamp(const struct rkcanfd_priv *priv,
>  			       struct sk_buff *skb, const u32 timestamp);
> --=20
> 2.34.1
>=20
>=20
>=20

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--j7srovzofhhegkby
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmgu6+oACgkQDHRl3/mQ
kZwUvQf/Zu5i7q11xkV2H03JkWE/1wlxLHx7VMrURyd63akKtOVArxlhguAXGspX
Yfhzzpt+1e7z6Wjg7DKw2PJsn6mnV/BlOLz7RlD+Glku2ktuPvGVO1rJU76xrLuL
hmM7ZYHKhJuJwdcv7Ww6NWktx17XWK2mt7iDJIjZB8mGJJ8OOfeUAHOTYvTnwfd6
SZlaukS/cbHcDuY4dZRRMi6cMiUTAgGRGdkgxysTQH278M8DydVXKzOHLah2siUY
x29rKUH/woQuUb12ISpGwc/GosqGng3uDZAh5cHLDjWiPToxZSESZ7BPGUs7SG+n
hkDNTcwCpmyzWdOyWwHkTUbBL6e1Cw==
=Ox4x
-----END PGP SIGNATURE-----

--j7srovzofhhegkby--

