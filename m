Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D8CFEFB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6eW6Ffiaz+a/K4TbWo3MIPEdUxUEHjHOWmvCKtzuvO0=; b=O1qrffl1vrSlr/3L7L9YX9fDwy
	XFzST4Lf6VxJoW4V8BBiLkbTb2zTP8m6BVb9dmDKb0NkiwJjUPNe75+UUx8V7/j2TGMmRXp2S+cnP
	BxwxbtiBC9uWx+ow+YKSJ17Iug+eTlDIHB8TUkB+rw0et/Q7WxekNtuuylwOI11I6Q1chZBJfjVr0
	rN6wNYB6Ho7aO9lkXpULhIbMqZF7buBCLZI1vkHFcaJ/SwO+LZ1mK5oizIJZ3xv1xtnp9SHBIESum
	Mvjr3m4szcpYjmv4u0N5r0aaTp6jVwdKE1K/lMD7pLviE1wWEwS9s83MEr09wlH1nD3txD1Ff1Sf/
	XptYo8dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzxC-00000008feW-0rd6;
	Fri, 27 Feb 2026 15:40:34 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzxA-00000008fdo-0MfY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:40:33 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4836d541968so2341415e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 07:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772206830; x=1772811630; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6eW6Ffiaz+a/K4TbWo3MIPEdUxUEHjHOWmvCKtzuvO0=;
        b=APmbKFmoDxB5ZwBaKO2tQWBfKCOXrCd2Wo73Y/dJerEsJxHjjETRILtmIZjxYFWeoS
         /SAt1tSwGe1vBJMHbd70BIpuwPtv7wwzxiuEz+joaP4d6Pt7iYj82xMWUmjXOSLCc3ye
         +sYPCBg4H/6mC2M4eWuoYFisPXXa6RIm5ygUwlpK+Nv2KJbkagvgHZIQYyA+7sJckwCQ
         I23WD8Nxht0lBb1/xZhtfYkRFH9NJxQUgknyqVtBWjLyrKhAOYqXXc30qcfP7c2o/3VI
         4S/+LeAAlAX0V41niOW67i3IyWLNmlfU9jqzxJCHPgzn1iaOiLMBtRxob2j6b5Sxe2QZ
         WTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772206830; x=1772811630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6eW6Ffiaz+a/K4TbWo3MIPEdUxUEHjHOWmvCKtzuvO0=;
        b=wJN2vL2cgLhKs2ex7glaGhGXEttHtwhLTP61xk/oO0mYMJPx1vKGv+/HhrJUwP+aYL
         xrpMVdgLzh1rGanibfMQSA28eyXvIiTbn06ZekiJCW+W9FvLAuALcbZh7zc/PWqkdM2w
         yOIOjHC76rLfPBT1zN8+VURJClk3gDqBebXsZB1+bkKcZKingg26pjXGxX1awkqMkIh+
         dXXI5YdG+d+yhY+E1+Q8TxPMVWDhHQIJWI1mn7BMGAogPruGFAEgY0gogat+/USWjRwQ
         sNjf28fbqxpuMTyP3pzpqaX03Wrl+YKWH1zC+8cr3SOYHwxj8ZDZ+mkvWmUkvQvcX/pF
         /nnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3n8NvZj6aiY9roi9aRmr9F9YfZvWHyR1VP7v6LXaWrSVuLWVAUQQhtlvfO4dEaEPoJU1DIQJSUHbskr0IntAr@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx34zISDADS+Be8ciESw2BjKRK+Ixtef/utmwzY7xZ9Hz4REKN
	4WaBLQF41oRBKs5yRLhh7kNbNr5rQV+U+XhJW+cF0+w9ZW4uLw741+IB6MXQ2g==
X-Gm-Gg: ATEYQzxJSlRDLbRtPAYjpm+1+jZNMiZ3OcgFdDeTjMIold3VFlMDKNx2KnQkfBSgspR
	ZIP5SeoyCbjmQqva2V9CVpyw/QvZVXyHfO7U/HQd14q4kIsullAxjxFVnkrDobbJA0+/gMyDnFY
	OuhIHOmg+R/CltfUDNuxoblsxQACg4A5hQYsSpkdbm0uRMwO4wgon7P46+TJWD4SDqhRwe3OGl1
	ZoIgvXHYP0Qg6qxjpNrf3LEd2yn8Rtc+sq7Mv67Z/kiEF6zO1FN6rOS+vn3oenS9uLzz9XB1Qc4
	VPLNhyhg2iNIiOWHkkRZocu5bDa/wD1mKuPTUjKALu9VomA64KU5XZcVkSGA08SGeDSBQhUe0UI
	9I2SeCBzK5IrWFggX2/SGS52TsrDS+N35+7E1G3Btj6tq1LVpQ96+9jQ6wxFElN77w73i3jtuIH
	S2I0HDqtWzzCADMA==
X-Received: by 2002:a05:600c:350e:b0:483:79af:ca1e with SMTP id 5b1f17b1804b1-483c9be0523mr30417725e9.5.1772206830140;
        Fri, 27 Feb 2026 07:40:30 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:ac95:d4c:390e:fb0a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbf016sm101582255e9.5.2026.02.27.07.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:40:29 -0800 (PST)
Date: Fri, 27 Feb 2026 17:40:26 +0200
From: Vladimir Oltean <olteanv@gmail.com>
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
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RESEND2 net-next 5/8] phy: qcom-sgmii-eth: use PHY
 interface mode for SerDes settings
Message-ID: <20260227154026.dx364j5scae4epqw@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <E1vvkUI-0000000AuPK-2IBa@rmk-PC.armlinux.org.uk>
 <E1vvkUI-0000000AuPK-2IBa@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vvkUI-0000000AuPK-2IBa@rmk-PC.armlinux.org.uk>
 <E1vvkUI-0000000AuPK-2IBa@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_074032_132710_EFB3CC49 
X-CRM114-Status: GOOD (  14.27  )
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

On Thu, Feb 26, 2026 at 11:09:42PM +0000, Russell King (Oracle) wrote:
> As established in the previous commit, using SPEED_1000 and SPEED_2500
> does not make sense for a SerDes due to the PCS encoding that is used
> over the SerDes link, which inflates the data rate at the SerDes. Thus,
> the use of these constants in a SerDes driver is incorrect.
> 
> Since qcom-sgmii-eth no longer implements phy_set_speed(), but instead
> uses the PHY interface mode passed via the .set_mode() method, convert
> the driver to use the PHY interface mode internally to decide whether
> to configure the SerDes for 1.25Gbps or 3.125Gbps mode.
> 
> Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

