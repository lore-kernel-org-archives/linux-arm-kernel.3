Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DA8109C021
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-transfer-encoding:
	Content-type:In-reply-to:References:Cc:To:Subject:From:MIME-version:Date:
	Message-id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4J2bs+Xgq5dSGZ9Mv94Ovt55+98SGPNbD1rG7ZHb4uQ=; b=AGF57rISIAr+ZZT2tWJinFr+Ym
	0NiHj3CO39+AhAcEzgY90wuxNXvUaEaeS7y5oT5dk/H8kz0y7NJnyhsua8FugK3CFsazZz/ieWIR/
	vtrlxgPCrCErcwU0BI/cDXXgWgXdTA1gVdEau4En6hSmIkTWZ49P4uZMe4WC5B+MWJE2sMWy5J2P8
	hJv7iivG0QFiYQ8oFUgUvj9xlyfhhsNxhk8HEdPbBqS+Frg6q5hXuXza2Qh/2xqPVKPq7zum3H7JS
	WqB0PSqfd6UCvIQhci2GjZb5xHxE62GsrB4X2e6cBRRf+Eoa1drXbTMkF/iv6b63Qjk6KsPtzVY3+
	fj/spFEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PAG-00000003ZFd-42Ly;
	Wed, 25 Mar 2026 14:24:56 +0000
Received: from abi149ajj125.mrs1.oracleemaildelivery.com ([129.149.100.125])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5PAD-00000003ZED-2GXs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:24:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=pta2002-202603;
 d=pta2002.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=4J2bs+Xgq5dSGZ9Mv94Ovt55+98SGPNbD1rG7ZHb4uQ=;
 b=eh3FxLvpjK/M33OF5I3Gjo9OPVXciBKKACkj9kLxtKyAN2VrfQ22Y4otVrEcynMhp4qmJN/Uu1EH
   7lSQ4Eg1gfrLt6xdOmPNRuwx8U99H+RqdEWkkkaX0c6kZbLFcmH1I/QTGrRaR/gPyBXHidowtq+r
   vuZR75P7q0bgbasnNMEUUZ1GkZTOz1wXmUrkSODVL3QSjS+5AXgFVUZGjrAgffXwsn6hx8LNYQE9
   MoWSWdvXUZ1eRxKXCnox5WAvKMza1YtA+JHVicidFFOikXAdNy3nu0pdock6uIs/oJwlmG8U41N5
   sxvoBGimS9QYgQDQqIKSsX/MVtYo6gr3+OSqgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-mrs-20211019;
 d=mrs1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=4J2bs+Xgq5dSGZ9Mv94Ovt55+98SGPNbD1rG7ZHb4uQ=;
 b=p/h4czYxaw1KUjU/HZDCwmDPXXd4mls6hupdk69NS+JGAWoCdJjtjCcA8WgH/ToL+AbWn6SfA9qk
   0kX4+xlx8Sd/xAclhxuRwmdvZX0pMJDPwEE2xTJ6QFwv0YIAKQSruDciWotiCaW5i96Fl6xGqq8z
   VzNJhE/0ZTrECDMf3Ea8hbBUiQZ0uVaUCrJjvwXVvH3p8weKJQcPTLEjlyKgjhmtxEXKAEdgl3j9
   i3Sv4OQWdcsHGN3zSLw5xNksBIGiHjg/1tTrY7rXdjpiGX2clrEo3yJBqcnM906vqBF+30bjF82P
   AdGhBSunhm1qF6/Y5weTNqFjTPsW8/5QCcnd2w==
Received: by omta-ad1-fd3-401-eu-marseille-1.omtaad1.vcndpmrs.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260212 64bit (built Feb 12
 2026))
 with ESMTPS id <0TCG002W5LDA3R60@omta-ad1-fd3-401-eu-marseille-1.omtaad1.vcndpmrs.oraclevcn.com>
 for linux-arm-kernel@lists.infradead.org; Wed, 25 Mar 2026 14:24:46 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Message-id: <1331010f-1446-4892-9d81-2f18b60f6977@pta2002.com>
Date: Wed, 25 Mar 2026 14:24:45 +0000
MIME-version: 1.0
User-Agent: Mozilla Thunderbird
From: Pedro Alves <pta2002@pta2002.com>
Subject: Re: [PATCH RESEND v2] arm64: dts: rockchip: configure hdmirx in Rock 5
 ITX
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260323-radxa-r5-itx-hdmirx-v2-1-c52501909577@pta2002.com>
 <3407927.44csPzL39Z@phil>
Content-language: pt_PT, en-US
In-reply-to: <3407927.44csPzL39Z@phil>
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit
Reporting-Meta: AAHaB8rt6U4pRWPuzg6HYoL14PsnJ3SvWR/H0/t4MAxeSZoxpcePWCN+kYBu4Dv9
 oyx+yTPV6GooNsUjV5T/IMVW9vm8S/sArtQbMZMl1GV8baPkbDQUJOQXlekQyr1c
 GDRTH7/y+z5xxb4xFV+sBgQg8dERsOcqaN3zHsaDAbH3hesStcJcsSKWAfFCqMjX
 Hmz2mtMwVWLqXOLZKyuAkNnEUqEYyCfll07Esyv/OEyl1I14SdejWVOeWojW07vI
 kDmkUUFTXxwwZAJM/Mg7o/c4I7KOtlyB2/eKX+4VeWvb6bAdeNwKwpVDl9uju6F4
 X+KGdiMdWpCC+9D9wnaqHZya7ZFjjm8lZ2fuRg5KDGtgpbcoZet4yFBC6d5MBuDQ
 fR2Amt4bJOvo67FX+5EC1L7ZaZe1bqEFXer2pCxpSDxlhVOh0+2mrHYqYm4sZHYg qYGyCr6n
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_072455_013987_D098AB73 
X-CRM114-Status: GOOD (  14.05  )
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

Hi,

On 24/03/2026 14:18, Heiko Stuebner wrote:
> Am Montag, 23. März 2026, 10:25:33 Mitteleuropäische Normalzeit schrieb Pedro Alves:
>> +&hdmi_receiver {
>> +	pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_det>;
>> +	pinctrl-names = "default";
>> +	hpd-gpios = <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
> 
> as said before, please also add a pinctrl setting for this pin.
> 
> gpio1_c6 is not part of the main hdmirx set of pins, hence needs an
> additional pinctrl entry to configure it as gpio and possibly set any
> additional pull settings.
> 
> And yes the pinctrl-driver does "implcitly" set the gpio-mode when
> a gpio is requested, but our more modern approach is to always have
> a real pinctrl entry even for gpios.

I am probably getting confused by what you are asking here, but I don't
understand what exactly I should add. There was already a pinctrl for
hdmirx_det (which is what the gpio1_c6 pin is) present in the file,
hence why I did not add it in this patch:

&pinctrl {
	/* ... */
	hdmirx {
		hdmirx_det: hdmirx-det {
			rockchip,pins = <1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
		};
	};
	/* ... */
};

Looking at the other boards, they do the same thing, but they call it
hdmirx-5v-detection instead, but as discussed in v1 of this patch I
ended up keeping the det naming to match the schematics.

Sorry if I am missing something, I don't have much experience with this,
so I would really appreciate some extra information.

Thank you,
Pedro

