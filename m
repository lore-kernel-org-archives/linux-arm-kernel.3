Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEF0CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 09:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JoFX+YMXd60kpER0QJajp4LEvvy2XvMbrnb9b5wYktk=; b=v0NWqEoA9CK6lavG3oyp+9XfP8
	idz5QPuRuc15xFXrFDIEHVjpKTHszyp2N3c9vVHMh8OgsJ+Q8QFB+nGsklisSDXiB9i23K+Mq5Nn0
	c6UtPUQTW6QPtPmV75GSLLpp4kpRpT33mFFW63vQUuJp2K6X9oc/py512nknG4w6GAX6sS3Z4Bmwu
	kOQ8W8aoqisQ2qbY830OaqXzjFBCWXj0sTQPZkulRVWwLHQfWTVc7RzsrBCyT3evBV9P57Q1f6hJQ
	yY0haLRMqjLX69+VPoHQs5noWrmP1OH+pJCtQZPJBcPLQW+y/u8gpa+CHw56GkfKGH2lIclz7owQS
	9qExrZkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDImd-0000000EdAs-1ron;
	Sun, 04 Oct 2026 09:45:27 +0000
Received: from mail-pj1-x1061.google.com ([2607:f8b0:4864:20::1061])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDImZ-0000000EdA4-0ky6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 09:45:25 +0000
Received: by mail-pj1-x1061.google.com with SMTP id 98e67ed59e1d1-3a49623b865so384992a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 02:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791107120; x=1791711920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JoFX+YMXd60kpER0QJajp4LEvvy2XvMbrnb9b5wYktk=;
        b=L655D51mT7GhvZ/gjkv4eaIGqkeE3Lkxirn+EcnUU1MUimcwJNXs6UYQEkE96RsQ+q
         XRLx3Y6lzbF0urq16DV64VJ5UleDzuaF6bJTP9l+G6D2nGid7zZaowwD6Zwf5qswdqwK
         60YjKKvXxsRkZT0L5n6BcRo7Z1j5tvZhV+njchjGGnrKZMMED8LOI1C3jYiP+zNlFkTm
         mGaBpF7q1yBl7CWa9fdQ/8yGEyAc4Qn9cI47PktYAXe1ROYXibNmQfmC73T8yui/B4FG
         +hMAJ+WPlx1jBw4RQuBgwVVVnK29HLldIi6edTx51PFgUfRZ0Os2CGqJSvINm0D23uBf
         Ne2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwQ3oOu1Hht2NtMIch96C5je7Y7rnixAMZeZ6LXLIMZrtTYU499ah+XUipD1pwmV4luZypPaK3cMv66bntXv7DJ@lists.infradead.org
X-Gm-Message-State: AFq9FYId8Nwr0zw99Y2VtR612OSRNQPiw1qcs3Kb1SVYMGOLzjf/Ajq8
	lmNfxRWuQit9HRtcspj4iuInIPoI1IIycuMaAutgjySIoQ2tS2xWCqkfts8ZRomBy7J3T9tRAXt
	smb3bmtmlJWrCpdE0XXLNcSMnVBG1knQmRMK/Dbw9MWCq5MYTFjqfrNti+aQNkU/vrTmHcQRZbG
	aaIFKIvEchXvmEXrrkwSu1j6DtvrKY46UiiQI8Lk7wgke/+9AMf9oVMQY9HXKYzUWTFSvv4Rbqk
	4ToHSsCTWQKbEme2hZ+X1O3f5DFGEwCI5tu
X-Gm-Gg: AYBFou1u8Q504rH7ENPu6FdZ8WHez6B3jE4bAausa4Fzf0h9sJAguNYj2ni2MlD7ILh
	c7yHjnVzTbDY9sd9yZIFapFSfQjTWmpPRVKAxZTBEjowvF53MsNR8i2Lv+kW5o2Oi0W18101W+Q
	9OLH3cepkNFve7RVEvAAeRfLGseN7y0+m0aRbB3tzl5utJ9u8FChGpYXAZ1Wg9Bsv90shbqXvS/
	uD/RvnKMhm1l7EbzoEcXmaNUzbr84ZyrXY+xLHzAPNYO4vnkEs7MRW/hZezCdEOc8D5rVJDnFUG
	ExtNLAjdNRLyLMNFQis1gfV4oniuwrL/7kmS11v+fGn51yNxJVbYzlf+YU7Y/li2yB5gr/bhBaj
	pF3160JbAxkqaj4sf4Sv3K1XL78S3b+BLAzHyJLIBfKEVVgAJq5awh+IH7zpFiBsHXI/nGkuiM1
	0naPKv2ffSqk5RtQtRFaDwZiLks2198VzAyG6CnNw=
X-Received: by 2002:a17:90b:1d43:b0:3a4:c028:fd6e with SMTP id 98e67ed59e1d1-3a7872b30fcmr3018578a91.30.1791107120356;
        Sun, 04 Oct 2026 02:45:20 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a78e49134asm2497687a91.6.2026.10.04.02.45.18
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2026 02:45:20 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34ef0362d95so1883613eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 02:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791107117; x=1791711917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JoFX+YMXd60kpER0QJajp4LEvvy2XvMbrnb9b5wYktk=;
        b=aSg29d92ujHBuxSwhhPwvf9ZscGVfcTp7xds84vZShu9H+aKRqJouQpvldBbOXcC+R
         tJzkZOVrl1DLE/VbUBXrCNX9o58oav/NJCA3gh6zth+uWY0xo9IWMliRa2MzZeD1HLb7
         zvgqAgf3fxTw83mJak5UokYpWbRPlLomD/kFQ=
X-Forwarded-Encrypted: i=1; AKwUvBwAzMmCx4UJON28zWxL448rUIN5mj0SdBacbqTqPzhf0xZcmS1Gx8dRZSUScHO9Mef1QY3UdYR2sZiSqCoWBHjD@lists.infradead.org
X-Received: by 2002:a05:7022:eb42:20b0:144:fc5b:2121 with SMTP id a92af1059eb24-151c30ec64cmr5879803c88.17.1791107117117;
        Sun, 04 Oct 2026 02:45:17 -0700 (PDT)
X-Received: by 2002:a05:7022:eb42:20b0:144:fc5b:2121 with SMTP id a92af1059eb24-151c30ec64cmr5879764c88.17.1791107116264;
        Sun, 04 Oct 2026 02:45:16 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fcec9a95sm12736954c88.15.2026.10.04.02.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:45:15 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next v2] wifi: brcmfmac: Improve D3 substate entering timeout handling
Date: Sun,  4 Oct 2026 02:45:10 -0700
Message-ID: <20261004094510.1323851-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915-brcmfmac-bcm43752-suspend-fix-v2-1-1bd84914998b@collabora.com>
References: <20260915-brcmfmac-bcm43752-suspend-fix-v2-1-1bd84914998b@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_024523_442313_2403EA17 
X-CRM114-Status: GOOD (  13.05  )
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

On Tue, 15 Sep 2026 02:50:39 +0200, Sebastian Reichel wrote:
> Some firmwares (e.g. BCM43752) do not service the D3_INFORM mailbox
> handshake when idle, so the D3 ACK never arrives. If WoWL is not armed
> the device is going to be powered off during system suspend and
> re-probed on resume anyway (brcmf_pcie_pm_leave_D3() handles that), so
> the missing ACK is harmless and must not abort the whole system suspend.
> When WoWL is active the device has to stay powered with its state
> preserved, so keep treating the timeout as fatal.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

