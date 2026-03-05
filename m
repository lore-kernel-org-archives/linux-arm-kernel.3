Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C23F30922
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLN3jU+WSp15lmHsKDg7F21c9tIpGoZokDbnzqxSsGE=; b=jg5AJE5M/CPTjDejPAcODUQkD8
	zXwom2CCVnf7pgCgs84yMdqa0QI0ufE9BQEPwGmjCbNHLQ/gzss0EeWFv0GxL82SGCTx7PcGhizYX
	oh7gVwLRlanSDIX9680GSRIHEC5sRcLTaBWmqOcWS9UuoE1R1B+kZX9TVH1QHDX5JAGfR5gtJt7dR
	/Gwpt0ACiIkuqBA4KrwtPNqIypKpTA+eIIUFPaZMPOCBZoWiTqnSmM0DLh/52yD311HTheiO8cPu7
	7iVgXW+zjGQ7Fioqcp8CII1NSLrn0AcoP5zWcbqfHfLn4hUnpGNguwLPhd6WU8UmnADFp1ScXUh3/
	a6xlvcPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5XG-00000001UkR-32ae;
	Thu, 05 Mar 2026 10:02:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5XE-00000001Uez-3C4p
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 10:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PLN3jU+WSp15lmHsKDg7F21c9tIpGoZokDbnzqxSsGE=; b=VqrQ+vEETWVjwsmTqMOoM0R/05
	0++YbyPv/Peg/tnmVj/skMvrv4MJDKI1yuQ0w+r8c97bdIaO6MkH0fFRoU02CnccFGhlulegymU6m
	x7hE2tA82SXF5V+o0d7Ckowi8Vah1rGMxOW+LyhV9GSDUjpOHcbj7KalmOZCj+mJPR1R3TKcaVd/a
	8tBZHJAd6sGmo2tJZykMuI85OtWA6MckQTlPEupE+AOPQY6I+5n2OeHmgkQNdw8rjTpDL2tpgoLrV
	yDkXBxqOHnxvTpgwE7kq2vkyQZ8p21fAVxCgDxJZeAYQpvJ6prMH/8Y1L89A7FpIxFmItaiIAV3Qz
	eGFDzv6g==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5XB-00000006QKi-3NDg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:02:23 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48375f1defeso59006855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 02:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772704940; x=1773309740; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PLN3jU+WSp15lmHsKDg7F21c9tIpGoZokDbnzqxSsGE=;
        b=UHBNqox5xeZikJqSm8QmS4wtXg1G38GZ+PnBAuzXRfRytdhe5a9idPZRkDlMQMFIPm
         Z+tywU4A9mo1vQlCT7EHhr0lXuE+DxX3kO56uXUZjmrVyPAWLDPHkWhqM7tlbZkFfZBK
         Fcy9V9t+/+hJoBaNgY7crLL/e6jiDBQ6vdTmpm5tDvJWWJqflC0cJ/p33VTpjUzZVE8q
         syoPYCwmCMZNQS2uY9hRwhnnC0tg0XJNy7hlpgIHVLVUp6gU0yoZsJiY797OpZU9PcUW
         5ZsD0ZypA/wKnI8Sb6fvAX6XKifNWe8lJGh2+fbgXMTOKtdklOTZLC7wDnPWvicmb+Cq
         oTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704940; x=1773309740;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PLN3jU+WSp15lmHsKDg7F21c9tIpGoZokDbnzqxSsGE=;
        b=jXOc2uZD085aSSry+Y0Kn5vocsZ0jnkbTynJWVEHsGzqIXLcXgrbTzNQmTU4fyIKW4
         TIyBhsfD6wfct59zF+63Fxkh++WFgpvARSeiKJbD0gkvQOQ7j7Qdyo4/ZmC+AUscf2AN
         F3lTsfhOPf2be0nmsmT0AP1qb6pxI5X0JbMu8F3VsMksZ9XnGTcGx9FzS6pWlHVNwzMk
         ApFl8oFL8xjN9vPxgrI8LH276kLGLQesn/4F6+1JMiPMVmr7iG3SXr5kYyFrc1fss5Ks
         1HKbLyMsmP+YHSpXdOfybVW2qjPOEIxDWA7JBmV/5n7X37ZNqi5xbbYCLvez0Q/IpoD0
         8l6g==
X-Forwarded-Encrypted: i=1; AJvYcCVS6XsFCC1UIg+KAF67J8HOMteiskIYg1y22I8F4a6vZTRlbZ2hKJdft2bdC9jtSr4Znex41Tp+6nbGAwDqZrR1@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy5ujCMtId+Q6CiLmV2C62CBtXhZZuC3sMKzHSia3xuaLV+h0K
	68Q7fOI5QnDM+mJSQLn5XHjSgbbtWCErWI7agQl971lDtZ6s9IGTIfXBTBoH61nMswY=
X-Gm-Gg: ATEYQzzPq0O8ke0yYBG5iAUaEVq6dfrs/WX8qcFYT0qqVg60mP1SRNRmcSR4gwCYNi6
	8h841RX3Y3jlvjXd1Fl5/gm//jVxafWVXh8DdFhpIjZ7No71Set3y93vSjwzAvhcRf9ijUXqgXm
	RwuaoToBCZlCW5Uw6sh9UIzk2RFErY12LWKNgbhnZ3h3Z5OiZxAHBYcpe73UNtl91qq7DJVaT9Y
	sbiR4qIX6VkWBor6X84x3MpCBM2hbxzDTa3l0hoF+wo6sCRU9GDxrX9P35fM0UPZedxDF1esL2o
	/gl64fGVqDgdusz033hESGdVhncWIkpC4RE8S3YqCxs4H/MSjqmcUf5oWIYkGR1h7sZXPJBCXCY
	0CFjMZQd7LBxCD97ZzHh9/KS/nHfgJuSQO6Vv/I5HJam6gL9910mm+Vsyae1rkinjeN1NYpMDs9
	MVH+3+3lnL5YTTQxFY1O7gMviMWpEz
X-Received: by 2002:a05:600c:a07:b0:47f:b737:5ce0 with SMTP id 5b1f17b1804b1-4851988f31dmr86977045e9.23.1772704939633;
        Thu, 05 Mar 2026 02:02:19 -0800 (PST)
Received: from salami.lan ([212.129.84.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fade9fdsm59453655e9.4.2026.03.05.02.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 02:02:19 -0800 (PST)
Message-ID: <030737fd255a49288349f06e8c1217a126ea9081.camel@linaro.org>
Subject: Re: [PATCH phy-next 05/22] phy: add <linux/pm_runtime.h> where
 missing
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, 	dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 	linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, 	linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, 	spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com, Peter Griffin	 <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Heiko
 Stuebner <heiko@sntech.de>
Date: Thu, 05 Mar 2026 10:02:16 +0000
In-Reply-To: <20260304175735.2660419-6-vladimir.oltean@nxp.com>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
	 <20260304175735.2660419-6-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_100222_018718_9D9100BE 
X-CRM114-Status: UNSURE (   9.70  )
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

On Wed, 2026-03-04 at 19:57 +0200, Vladimir Oltean wrote:
> It appears that the phy-mapphone-mdm6600, phy-qcom-snps-femto-v2,
> phy-rcar-gen3-pcie, r8a779f0-ether-serdes and phy-rockchip-typec drivers
> call runtime PM operations without including the proper header.
>=20
> This was provided by <linux/phy/phy.h> but no function exported by this
> header directly needs it. So we need to drop it from there, and fix up
> drivers that used to depend on that.
>=20
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

> =C2=A0drivers/phy/phy-google-usb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +

For Google:
Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

