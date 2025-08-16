Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BE8CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 09:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4WiZ9ddpNrGSgA17pjQ7Do4+YzZaiUY0Hg+kDmv11gc=; b=0YkrFScPq+Su4MTWAwsc86Vrhy
	LA9WmJkvMteUfteas84xoUOLuJ78xoqBnf3ApqUENRepa51G7j1DrzihTEUXKT/kfjYgBQS5wkmNs
	JZHA1P/tm2N4wlpqHwEtAelrDg8LBvXG+ScEQlGLKpaeEVVi8XEnQyQ5AAyAx+R2o7WwyekwNEnyd
	qoiDF4bYtbIgVknAI7kfuKae0g4hKWXWRje+5J1q7xc+cowiAMn4zOCMRKyuwap1b1LYXC3wk9yDs
	1aZUYDZ/htEXfV/KU0JenZN7+elEOEohXPYcV4CMRxxAGztK/dOtN6diw7VKYSjnqldgSK5dePOhW
	vqKkAWxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unDJq-00000004P4b-2gSt;
	Sat, 16 Aug 2025 09:35:22 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unDFN-00000004OQ6-3dVO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 09:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=4WiZ9ddpNrGSgA17pjQ7Do4+YzZaiUY0Hg+kDmv11gc=; b=Yvy91sGjFKWDa4QDCuhWNnVenx
	rtefdrPoiAQWGr9MeAIc7RK82rncwbCMaZ9LzIPmlJbq0H0Jv6sGSoa2PCNlAYwvUMQX3Mrxj50Of
	PSrKQn8GzeSayzurAzGZDOCITckNcrDPTkyAK2q3E81XLOs1G3Oq0O+Zh9AoSE1Nf27060FF1Yt0u
	pzAGcFMJv7aS+01yltWJrJa08mkLyTKdUw6JZdeZSu5i4X8s+qAeD3SEVQe3EpBuLGHCowc1AoBvq
	QgGn0AKP5mnr+zP08R+EtL8ctwoOiaEMaaheo2xpLeNv1mY/J7ux6RIEtVXq65vVTRnH72REkGMJy
	0avR0ryQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1unCzl-00EmJl-2C;
	Sat, 16 Aug 2025 17:30:35 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 16 Aug 2025 17:30:34 +0800
Date: Sat, 16 Aug 2025 17:30:34 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] crypto: stm32: Fix spelling mistake
 "STMicrolectronics" -> "STMicroelectronics"
Message-ID: <aKBPutUbmQCp28YX@gondor.apana.org.au>
References: <20250724105754.140400-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724105754.140400-1-colin.i.king@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_023045_902485_A3AA6422 
X-CRM114-Status: UNSURE (   9.03  )
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

On Thu, Jul 24, 2025 at 11:57:54AM +0100, Colin Ian King wrote:
> There is a spelling mistake in the module description text. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/crypto/stm32/stm32-cryp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

