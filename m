Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF22AFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 16:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXHH5R0BhkfDr9Rlhn4zkhBVScUk87tQK0t869TJNfs=; b=KhlKEf5RiAfa6fuE2kiDG++RBj
	SHysh0Vbk1daz2L6OiZRaGtAoc1OVCWsyBOHMlvOEls9BVHeJop5cndIlngEDnCiaQqu6T9tYRt1k
	LszkghDcWcfbHEr6+YVG78Cv7FQ/h7CzxybSIJ1+xoB2UFFXM/pwLeUhrSVte1o7dhL3zmPh9/56T
	Ln5ScEepMxFabSH4NjKnX+tqwcWC26ZevampYnBPzyaC8242sfiDETWnuLL0374yhtYTkWbtiEeWE
	r3CNTKE1SMWgTiHfwkl1Ei/GvVKI74iQgK5TvR3/r6SbaFD8JNho6GFgw6EQq5b/ErCzr6/vGFBoM
	hDSe0h+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJvoz-0000000DfMF-3A39;
	Mon, 04 May 2026 16:07:01 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJvox-0000000DfJL-22VA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 16:07:00 +0000
Date: Mon, 4 May 2026 18:06:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777910814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TXHH5R0BhkfDr9Rlhn4zkhBVScUk87tQK0t869TJNfs=;
	b=p1aS4hxXQdoYxJl01ex/zyh1gIBKENy6HFUjEuaXCgIlTmj/aGmQbRoWJ/6h8KGkWC0CUb
	A1IZO/9QpQSq5kxq3F/aYYJxCKDc40QKoZ+NfqarPnqO+CVjm38O5RZhJgwLDWP5Ykipi/
	ljCwV4z26CgUvCS7QgkwRz8uddzgqx5ZxiGUr9pOWD1lkEaCKRK5SsAxSVPvyPTsSCCz0X
	s2ZYRMylCw11Vgt/x4iQGuONyDal8xkZ05O6OH4RPenA8faTdBxJc6qcOHlkTSC0X/JoY3
	q2OJyknhxOft/Q2vucjl7oiRrrAohHITaAE58ObsfV20Fbo9cLsiz+VlKkGavw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777910814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TXHH5R0BhkfDr9Rlhn4zkhBVScUk87tQK0t869TJNfs=;
	b=nIlKXDszLqqxfyZ58gmZFU0fcWEreTuYJ7Q+6yLWHuRvHqEXi2+06DZwnD6Ya+Rqgx+XEB
	K/FtxzX6m4jMq9CQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	UNGLinuxDriver@microchip.com, Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Bjarni Jonasson <bjarni.jonasson@microchip.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH net 2/4] net: sparx5: fix sleep in atomic context in MAC
 table access
Message-ID: <20260504160653.4acdravI@linutronix.de>
References: <20260504-misc-fixes-sparx5-lan969x-v1-0-6604306b5743@microchip.com>
 <20260504-misc-fixes-sparx5-lan969x-v1-2-6604306b5743@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260504-misc-fixes-sparx5-lan969x-v1-2-6604306b5743@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_090659_671768_9E9FDA71 
X-CRM114-Status: UNSURE (   9.67  )
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

On 2026-05-04 16:43:43 [+0200], Daniel Machon wrote:
> index 2bf9c5f64151..0797cfa32916 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_mactable.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_mactable.c
> @@ -50,7 +50,7 @@ static int sparx5_mact_wait_for_completion(struct sparx5 *sparx5)
>  {
>  	u32 val;
>  
> -	return readx_poll_timeout(sparx5_mact_get_status,
> +	return readx_poll_timeout_atomic(sparx5_mact_get_status,

If you do _atomic, it becomes atomic. That means it does not sleep as in
TABLE_UPDATE_SLEEP_US for 10 us but spins via udelay(). The
TABLE_UPDATE_TIMEOUT_US is set to 100ms which _might_ be high. 
This is probably just nitpicking (given that there are other drivers
doing the same with a greater timeout (READL_TIMEOUT_US)) so feel free
to ignore it.

>  		sparx5, val,
>  		LRN_COMMON_ACCESS_CTRL_MAC_TABLE_ACCESS_SHOT_GET(val) == 0,
>  		TABLE_UPDATE_SLEEP_US, TABLE_UPDATE_TIMEOUT_US);

Sebastian

