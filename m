Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36E0109E55D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 06:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8tYPKzcvltGXfQ6L16pIF3z/zsa7nvHckK/DysYQCw=; b=pKOmH6G6vvMUnljhIv78uIpm1M
	ATnaOk8TZLrITJb+Vfs61rxjYv7zDN8y5Asca61T8DBQBYMoNNiYeMYBh8BGxi9SCfgHerfNEKyN2
	YHlM15AM2c+WyKmUZBsfiPs/IBdA0tjXA1D/CZA3Uq0h132tCsV+x+L2B6uEZ+/ZpF5BW6cNHbYgD
	/fg3z5/cVVDzQpv6YL58rdUWvlGwo5a3y0WFB/nyGW3ZjpIJAaIk6iBk4DVU6quuwDv9cfLULjxze
	Upkybj5B9PejUwkEkHXKQ+IrcSCMVGNAHwtBlMD4vZJDlCxARvHPclOhQXyyMSDxHwXNs/sl02Ke+
	glBJFkSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eei-00000004sev-3QtO;
	Thu, 26 Mar 2026 06:57:24 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eeg-00000004sec-1Z6T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 06:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774508240;
	bh=U8tYPKzcvltGXfQ6L16pIF3z/zsa7nvHckK/DysYQCw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZWCVvnepCwKjXCZ+/zqNrIFnx8K/tZccf6sCu8lpiOGXFBuv1Kx1EFFwf8osfZOAL
	 4Qx/3keNYZhbxIe9LjoWIl2j5XVMU0Z6nt/P75jczebkxVql2pxVe6BXkskSVYpQLr
	 u2SNJ47/BsAQkaXAYqZc7M5B8iRtJjXejk34WV/vB8+YQVoRFAnWmTfTGj+EgvlNG1
	 hRjecmdPNnqJWgR9lml3cwNMr7Mr8Zu9yOyCDqT5W2DMF7otDfjwTv4hysS/u8Na2a
	 jWU/+5eZF/NXS0i2WBVPI+UltVC7t4n5zkb1PKOtNEB8sOOBArdxuvYGbd/oM+ky85
	 dQvl8nSgf28zg==
Received: from [127.0.1.1] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0AD896597C;
	Thu, 26 Mar 2026 14:57:20 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: joel@jms.id.au, Julian Braha <julianbraha@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260322230223.1393885-1-julianbraha@gmail.com>
References: <20260322230223.1393885-1-julianbraha@gmail.com>
Subject: Re: [PATCH] soc: aspeed: cleanup dead default for ASPEED_SOCINFO
Message-Id: <177450823998.724052.17604536856953003576.b4-ty@b4>
Date: Thu, 26 Mar 2026 17:27:19 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_235723_247398_4188A1DA 
X-CRM114-Status: UNSURE (   6.20  )
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

On Sun, 22 Mar 2026 23:02:23 +0000, Julian Braha wrote:
> The same kconfig 'default' statement appears twice for ASPEED_SOCINFO,
> which is unnecessary.
> 
> This dead code was found by kconfirm, a static analysis tool for Kconfig.

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


