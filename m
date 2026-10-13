Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3BDCC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 14:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXCKXtUeTwD/OXxcWsx0jhFweCsNl4NPwKugfx/rprs=; b=Qcd41WmevZKFKoVTROG/WhkvzQ
	PfvAYswWnAI+53CS/6AgNgwH9TSJL2SZC5uvgYLtebOGjaI8/lYBHdKzQ3P9fArWGj47D+J+zM4S9
	TtonxRkkdmtNexdPLXTvpAHS/y4zUrSJwiWKR386Hn6ryt61Jv8kRjk+1PTm8AZzhQuJJOiB7W5UB
	3e32GwXQFOxcXdVAfYvZ7Kjicbh1WllKHPsLtA/wsrkkiEr71c1n4G/gZzf8uZ6u26hNnotE3GxfJ
	31qyT52qaE4VTbbqNT2y1ZNiyMsNZRUu+lrkzaL4VvZKRUN8L4MKpncTmwSoA2sbtVm9UNBLdYIkZ
	YwipLAoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdh2-0000000D9Zk-1efF;
	Tue, 13 Oct 2026 14:41:28 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdgx-0000000D9Xu-2aw3;
	Tue, 13 Oct 2026 14:41:27 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 3DF31200467;
	Tue, 13 Oct 2026 16:41:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791902481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qXCKXtUeTwD/OXxcWsx0jhFweCsNl4NPwKugfx/rprs=;
	b=KIrlBa2URZfmD/FmqJe1GWgkO+I6mlqaHLch1gzsY/k44XUy2cfZGo9vqcPbA1b9V/36Yd
	r6QMM7IDROOYNXe1XPb6FaSqE7tCbb9wYdikvo4UzheZa8Z3jdFcPgSIpiQ6FgyprSyJHW
	aWiVnazkzlI0aBCiwGI5AcaNjU0W8GV1ZOFkDXrbLJDjO/VPKC9uXiPadh5b+nAGQCxuOr
	fSLhLNclXGPy9ugee+c/RxCaM418A9lbnAoZES2m2YkB5TLm5JBax9WTu0P6Yfel5oLyV6
	GWLKdGAxn3nYWu2G3XeEk3ltcuolefG9SIBq764AZhXrlIOMy5HbjVPDKR3ysQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791902481; a=rsa-sha256;
	cv=none;
	b=JN6F6TbuYqKLjPPF80taIetatqg+2z/bfxZEpFcT9idjHVAQxSgPhtmPvZhdNlHzQlOqMd
	0dbjmCqNT3NZ7cMoSe0d4cLthZsJfKAIQskjj7YoOGp+V6CyXVWflgdQBRc+Gu8pEGICUt
	mYgOfhu14y+skHgGoWuzJiqFahTBvkMuk966JrXJvHsRg3lmZ8+ZhVuVTkf/4qKBCc2kkI
	NnexPpgj2qCy+H2NhQWOlthSehPwCwDlQuY956kOo5Nar3Re68Tn7Tf7jN+Y9mKxLn7HDo
	m6mQEw2N+ytOfvl37z57loRZQMFZHrn7s1ykw7AT/uprWHBX4C+7D+4V39ucBQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=mkl@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791902481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qXCKXtUeTwD/OXxcWsx0jhFweCsNl4NPwKugfx/rprs=;
	b=YsqVrj+W6O1la8psQxwk7jDSFTYI2jODhzGigggnXZlA0ncOEj4tvLlTHANrXADawLaFpD
	WVA1o+wEK9nzQhi572OXZZXDRvPob9xW+s14kRRNVvOSBFQtxKVNomaa0tIsQ4MWUO4kdl
	M1fjaG50kAdN3p9WBicPx8m5T/nzRbsdR/m1FBgwqPFK2mCZwfyUoxM1kOqXJ1yuOCzRKe
	gwrjrJ46ISnd66g+cg7FOqNFPgx7sA/68xwC4CA0W31aslmg5eGg090pbhWlMvGDhysg4i
	UrxqPmewEY0n2O1uvaYdEYrPRJaqyyLkWy9pgFiXAY1BK0QJgmacX6R1mhDSkQ==
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1xGdgv-005hwf-0O;
	Tue, 13 Oct 2026 16:41:21 +0200
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id BD0BB5C322D;
	Tue, 13 Oct 2026 14:41:20 +0000 (UTC)
Date: Tue, 13 Oct 2026 16:41:20 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Cunhao Lu <1579567540@qq.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	kernel@pengutronix.de, Heiko Stuebner <heiko@sntech.de>, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH net] can: rockchip_canfd: stop bus-off restart before
 closing the device
Message-ID: <20261013-mysterious-enchanted-manatee-2e75af-mkl@pengutronix.de>
References: <tencent_5802EE88434010229EDF7A53084D994C6106@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_5802EE88434010229EDF7A53084D994C6106@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_074124_228845_3C06DD36 
X-CRM114-Status: GOOD (  11.88  )
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

On 13.10.2026 11:22:37, Cunhao Lu wrote:
> The close path cancels restart_work after freeing the IRQ and stopping
> hardware. A queued bus-off restart can therefore enable the controller
> and interrupts after teardown. It can also restart timestamp work before
> runtime suspend.
>
> Serialize restart with the close transition using a mutex. Mark the
> device closing and mask its interrupts before synchronizing the IRQ.
> Release the mutex before cancelling restart_work, so a queued restart
> can observe the closing state without deadlocking.
>
> Exclude the IRQ handler while reinitializing the hardware on restart.
> Do not disable the shared IRQ line while waiting for work to finish.
>
> Fixes: ff60bfbaf67f ("can: rockchip_canfd: add driver for Rockchip CAN-FD controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cunhao Lu <1579567540@qq.com>

pr-bot: cr

-- 
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung Nürnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

