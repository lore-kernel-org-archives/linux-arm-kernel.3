Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8274FCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 10:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+qZ95HZFsP1kpcpdZJ4PZeK+x0Rnxj1SgBiDelS+1Y=; b=X6lAClahYt5jV4wkk0tr/0sLqO
	S87PMuANB0RmiUgsKsOyMiZMPdWoGSIMR1e5EC1bGBlhZ/Z+8ZwH8BWWPvUzW5bvIOZOs24wUciOa
	FfEI2FGxHT5EU8e8BKiArv2f1ojZuNgy+fdHu73RVX/bSnM/lCHlLymXhHQ4cK0c7vMWOylcr0l0D
	8y5OyCISyo3mfDCOCaL04mWvTqBd1/X+3rrpsw/qDJ1/4VND5Kw/nnlWNkySh6cjwKG8BpsIB2Sj6
	Qj0WaF8ZNUSgteX1p+hlk3iM/PadGxbSPXDAd+UFDzxQ3gX+KoRgelXeqedpABnkXI2JZ/OBkxpCh
	hKs4H4vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6RVu-00000003eOP-2bNB;
	Wed, 08 Oct 2025 10:35:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6RVs-00000003eNx-1iq1;
	Wed, 08 Oct 2025 10:35:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B737643911;
	Wed,  8 Oct 2025 10:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371AFC4CEF4;
	Wed,  8 Oct 2025 10:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759919715;
	bh=eKipOXTHrNc1OdTzh4pva+hG4+Mk7E/fhYSndKp8ZVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iEF8aMoAGKSXq9PA6uDiSbiVL9GUW+JI/18n9rDm5UoPFo/wRKHKw35CIpzyMNZQU
	 Fuwfu0TOC7rq9+zvdP71OvM+64XU/Y0geh7yIGGaY0vhc3CFRN25lXybYxpCbviyYf
	 EYW8TpTTS0boSeo1AUOP+ZjFx2tgN8eLQf0pUnvI=
Date: Wed, 8 Oct 2025 12:35:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: linux-staging@lists.linux.dev,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vc04_services: mmal: fix typo in comment
Message-ID: <2025100805-early-shindig-fc85@gregkh>
References: <20250918115619.1616818-1-weibu@redadmin.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918115619.1616818-1-weibu@redadmin.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_033516_473781_34786797 
X-CRM114-Status: GOOD (  15.57  )
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

On Thu, Sep 18, 2025 at 08:56:19PM +0900, Akiyoshi Kurita wrote:
> Correct a misspelling in a comment ("recived" -> "received").
> 
> No functional change.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
>  drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h
> index 471413248a14..1889494425eb 100644
> --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h
> +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-msg.h
> @@ -13,7 +13,7 @@
>  
>  /*
>   * all the data structures which serialise the MMAL protocol. note
> - * these are directly mapped onto the recived message data.
> + * these are directly mapped onto the received message data.
>   *
>   * BEWARE: They seem to *assume* pointers are u32 and that there is no
>   * structure padding!
> -- 
> 2.47.3
> 

Already sent by someone else before you, sorry :(

