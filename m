Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D56D73EBB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 07:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QRj96uRo64aWLHg/hRGFxMzeqZXspgB4KH4n+Vp5fg8=; b=DURODjvCj/t8lAImEeXMqb615n
	DEJlsb4jinnnptG07FofEwTa8kaZE1sfiKKrXBV3bKxxRm5i5xJB2aOJ51X+L56sq5JCLsW/a31RZ
	ga+P4V2RJH0tM0DVH+lUc0+DptlbMRyd8IK1ZPyHT66O07w3rNgX3Cj8dWJEjt3BrBZKhi2NIeR/P
	350srhPHQt49ODSwOL+i4rmNa+yl3BxxmAyZLMKuZYaYcuP/uRB4GyKSPhYmzPqQsYx6c3KmVl90K
	gLX+76jUOekOfnIEwxY6u5YDVqGA0x0Ca93erxZArJRLiEGk7wiuCj1W+JgC0r8NgaFslae6t7pK4
	CGdy54bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmo4n-00000004a2K-1Wdv;
	Mon, 02 Feb 2026 07:10:25 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmo4k-00000004a1p-3sek;
	Mon, 02 Feb 2026 07:10:24 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c67:86fa:bf02:d5f1:808c:8622])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 814F8591;
	Mon,  2 Feb 2026 08:09:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770016178;
	bh=YZ/tewcWhRsJNqjs4UcG4vhy52VFy5OBEayFPeVwgqY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=uTP8CjO3nbEmZpnco1Qid4dhHFRYhBaIIjY2cufDhjC/BSgN+MUnhcfrXEcYHyKzy
	 OaDISBxe7TKAw9lR2ksbov5VETbdfHqS7837JM7d6E19/hiN4oTP1b0NIrBlEGqnoI
	 Zf5JFWmEgdK0w1lSWJocT2HJELTCfi5TomzjQ24A=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260130204628.312246-1-gascoar@gmail.com>
References: <20260130204628.312246-1-gascoar@gmail.com>
Subject: Re: [PATCH 0/2] media: bcm2835-unicam: remove mentions to dropped driver
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: gascoar@gmail.com
To: Gaston Gonzalez <gascoar@gmail.com>, bcm-kernel-feedback-list@broadcom.com, florian.fainelli@broadcom.com, kernel-list@raspberrypi.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, mchehab@kernel.org, rjui@broadcom.com, sbranden@broadcom.com
Date: Mon, 02 Feb 2026 12:40:12 +0530
Message-ID: <177001621293.9154.11573744143973861807@freya>
User-Agent: alot/0.12.dev62+gb9d6144a6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_231023_151726_B00AE88F 
X-CRM114-Status: UNSURE (   8.84  )
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

Hi Gaston,

Quoting Gaston Gonzalez (2026-01-31 02:15:39)
> The driver bcm2835-camera was dropped in commit <90204a38a760>, but it is=
 still
> mentioned as a current driver in a comment and in Kconfig help text in
> bcm2835-unicam driver.

My bad, I missed the non-code mentions of bcm2835-camera while dropping it.

For the series:

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

>=20
> Remove these two references to the dropped driver.
>=20
> Gaston Gonzalez (2):
>   media: bcm2835-unicam: remove obsolete comment
>   media: bcm2835-unicam: remove reference to dropped driver in Kconfig
>=20
>  drivers/media/platform/broadcom/Kconfig          | 5 -----
>  drivers/media/platform/broadcom/bcm2835-unicam.c | 4 ----
>  2 files changed, 9 deletions(-)
>=20
> --=20
> 2.52.0
>=20
>=20

Thanks,
    Jai

