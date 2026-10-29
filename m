Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A98606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 19:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IOld6JfF;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PQ+r+NDI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EP9nzlx+H2sk50SyAzN5S+n1xSKA5s/U/jjen9Qb6t8=; b=IOld6JfFR/1XxajV7nTUVzGUV3
	wNVNxcNqlIn2p2GG6ypkM269lcbCESbntC01N89wHfnMGBJQ2goqVwCi+j2O76K5Nk0wJM8j3tX6h
	WY6Ig4bjKwS62x2VVJRHgTXNMLIZOx2y65hu/aNCnRDnA4gTTd2p8+NX8cdIWNcH8f76AmrsFhoJU
	gpqp46Y6I4qolMcTCBO7fyjNxC1gQUWtGxG4CX88asaERYZ9RKOlLeRtvye903QyNpEIwziGQKQpU
	yN6z912YSQYOBYCNEdUhmx41Lx9Fl4+xcdL+JGcFdYvgHt8VFkgYDG42oEzfxAp9ohUTDNbKQvN0a
	jjWN2FtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVSi-0000000AD5a-2rsg;
	Thu, 29 Oct 2026 19:06:56 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMVSg-0000000AD5E-2ovI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 19:06:56 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1a3c08d6928so3379551c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 12:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793300813; x=1793905613; darn=lists.infradead.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EP9nzlx+H2sk50SyAzN5S+n1xSKA5s/U/jjen9Qb6t8=;
        b=PQ+r+NDIFMDa6O9S9HdnY3j+BN1bnKQGYv7H+jm9hIYvPiHvj8id0nwrklgdohskn3
         HzLfeWMP1V1fgF1Iuj34Tfd0DJN8qZENyGsnXjGJv9i8RxMn4ycOtm8HSrqfNLWb+n3G
         ueiDcG6+fbL59UpF7p/XuYnivuTN0bwsdEmZMLRD8qJY/5yYsP/uJZS7Ds07HzlWZDET
         u/1L04mMOOpQtHJUALreUdOIroeTyY0BVOltPAnnuU+aSTk02/YrWNedbeB4u/lHmjHo
         Z1904GrqVqJwau7ojv63pUMe6NMr7gWmQdie/UWxY6iMt79LOfIwcYhSZSoscxF2JunG
         ic/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793300813; x=1793905613;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EP9nzlx+H2sk50SyAzN5S+n1xSKA5s/U/jjen9Qb6t8=;
        b=gchLvE++DaG2Y0OHUfEcUnF9i1JGXWtDhFeKUNKzX21jVwjmd3pJHmVpyCLxd1A0AQ
         fOPzhYB7hXzXSchLO52dueWijiA86N/YzUPd8V3ka458Abd0anFKE+zRkduDN6lh66pq
         SM/Rl1sgetdRP5vtO7NQcPrS3//T0IX1Hq9TAlpbhk/emRY51ELwRu6c/IrSqIjj/4O9
         AAih/lKJzDOyJ6XZXcPONVimdp7sGXYRxYeXl24kInmGY71yXVaQbg0DN17B4bM91XVV
         rKYJt2ViK8CnRlJ9ZjTxgpegDsdTC/oCfML09p/UNHulcJoS3pyuXXMVP6EbhCNaxku5
         WTAA==
X-Forwarded-Encrypted: i=1; AKwUvBygqJ3iw+j7S+3n1FseQoHYBRcAgbYQ1NuUYNeG1XR4Qv+KD4XfS3WS6NbAYetmB0lwZIlapCHMjHh1gSVD4z6s@lists.infradead.org
X-Gm-Message-State: AFq9FYLJdqUU6tL29H7f2W4dizqUwq1mR46sMSZd61e3ctzITitnbO+4
	vwT3BTta3w/b5C0cfVsyAszvOcHxJS1bGqwXDK0LVs+Llqb7jyJvu28M
X-Gm-Gg: AYBFou0iDEnIFzb+NPi4xcFYCUF/Kc2JepkH7FHmo2fZZVXwFCkHyWqFBi1+Twq3I8w
	a+tne5ntAEgrJplmpNzmOnFYjtYK9VQhU9HGGRiQDdtLkU18ULWwElcA3YZqaf14Gl8U3xWEiMG
	48raaKR+zURxcSmL5BvBNHQ1ObTAZ4MN8mP4x8k499kipXZJGFYc/6LW5PrBsw2ZcqBxUS2Ntht
	m9SCQZ/fC/144xI7NXNTh3bnq84C3hqobr+33T480Jx5XUa0oG9/npkDcqNSRm/vXJbbDc9PLJa
	tiCvrRfOir6hgJKUjLc3WEd3oX6pasQMW9xTJyeWiT9l7RkzRfSxmnh/8uDP3xboR75eVwUTXQW
	YZ1SPP/iLeRdguNusSAWSUXqtzAl1n2tI9BvMCKdy0oS4nPpYbz0zVgWjiLQC+fVPyr7Mi0FKgs
	8piJAKqJ4Ikka+eNUJDvLKbr726f2Rt6QK8kc73HFigy6uYDKcbh86HFSg/XMhgtqKEbfh3ecKh
	vtwRYaxTDbFxzr+h2ovpzASmmzbEmql2yMlTpuei4HmT/VUcTs6T4dU/LlXkqpjTnl7paPhTC+7
	ev0w3S4sUfQZ7c2Vhr9o0/aoHbHcYDMeEDCt9PgnnbEQk0szkmabhiYb84PDTjB23pvr8Q==
X-Received: by 2002:a05:7022:ea8b:b0:1a0:f970:4f5d with SMTP id a92af1059eb24-1a6ce4ea2a3mr7493584c88.17.1793300812571;
        Thu, 29 Oct 2026 12:06:52 -0700 (PDT)
Received: from localhost ([2a00:79e0:2ebe:8:8310:80a5:1043:3f70])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c2e9dsm766922c88.9.2026.10.29.12.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 12:06:51 -0700 (PDT)
Date: Thu, 29 Oct 2026 12:06:50 -0700
Message-ID: <a23c924469bdccf3417141c904713a6a@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	soc@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 1/4] gpio: sa1100: register software node for GPIO controller
In-Reply-To: <8bc1c573-bd4f-4dfe-9d7b-8b17d386ada7@app.fastmail.com>
References: <20260706-sa1100-swnode-v1-0-332759bbd930@gmail.com> <20260706-sa1100-swnode-v1-1-332759bbd930@gmail.com> <2a561a27-a3bf-4cac-a4dc-bfbc5c859f45@roeck-us.net> <8bc1c573-bd4f-4dfe-9d7b-8b17d386ada7@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_120654_738894_BDAB6750 
X-CRM114-Status: GOOD (  13.26  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Arnd, Guenter,

On Thu, Oct 29, 2026 at 10:26:05AM +0100, Arnd Bergmann wrote:
> On Thu, Oct 29, 2026, at 05:23, Guenter Roeck wrote:
> > With this patch in the tree, the qemu "collie" emulation no longer works.
> > There is no console output.
...
> Hopefully Dmitry can spot an obvious fix for the regression, otherwise
> a revert is probably best so we can leave collie working in the LTS
> kernel and not spend much work on that.

sa1100_init_gpio() runs during init_IRQ(), before driver_init() sets up
swnode_kset, so software_node_register() crashed dereferencing a NULL
kset pointer before the console came up.

Only the GPIO IRQ setup needs to happen in init_IRQ(), so I posted a fix
deferring the software node and gpiochip registration to
postcore_initcall (verified with qemu collie):

https://lore.kernel.org/r/20261029-sa1100-swnode-fix-v1-1-112f4d83d191@gmail.com

Thanks.

-- 
Dmitry

