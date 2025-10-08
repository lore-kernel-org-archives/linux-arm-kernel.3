Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630FCCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 10:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAvmgNgZPO1e70aWG1Ki/NO75nTavJxp3KmfOFMDQc8=; b=rlEK/RMSznFl1ZI5UsPiXopYPk
	LRTErCaqELngPROQkANh8dt9+xfRlAxFZNinqxRvZg+DRKaUZ2Fj+X6TKji8H8QQPOq56TIo/+LSi
	hE6g5waRag70CzHCpqvf8UNvkhOJO3WuSSbFwLYN6xm2uOU0u5ceabr3jK2osIIo7J+sjbTr1UbWS
	bixa1IWR2enjov5lD/5bhbs9KGmPx7Lx8AuV7F3RylU3328LiSQxsGhr0Sy5ZgQMK4h2AvnePEZym
	cwYOmpo4gjDgHG91i6hC7nogfL3Io2YCnYwwQNWuV+6dnFirelaHEjrxNXoUNf0gf67QGldDtmASy
	7/9mqUNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6RVA-00000003eDE-3suR;
	Wed, 08 Oct 2025 10:34:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6RV9-00000003eD2-1IgW;
	Wed, 08 Oct 2025 10:34:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A462F61F4C;
	Wed,  8 Oct 2025 10:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B65C4CEF4;
	Wed,  8 Oct 2025 10:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759919670;
	bh=EDULCh+kq5lgtOP6xu4+4q+Gz7djMrt5F9HH1/LcYBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pKz3RM/XmuxC89BzVbKk2/UHU1iC+Zg+dGmm2C1IUzal0kTKvztkdtb9oa4h2O1FP
	 Vbc7h5KqOrLu4LHHqwbQ3PJdmUzAW51CbKebOSUp/q4luDJAc3xxNM4djPj9Ogi7i1
	 xlvJPq7PwSj/ZG3/TgPFa+FVa0qzXJ2b8uetaN1s=
Date: Wed, 8 Oct 2025 12:34:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
	umang.jain@ideasonboard.com, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vc04_services: mmal-vchiq: fix typo in comment
Message-ID: <2025100822-bobble-basics-137c@gregkh>
References: <20250923043617.2482243-1-weibu@redadmin.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250923043617.2482243-1-weibu@redadmin.org>
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

On Tue, Sep 23, 2025 at 01:36:17PM +0900, Akiyoshi Kurita wrote:
> servie → service
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
>  drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> index 3fe482bd2793..c2b5a37915f2 100644
> --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> @@ -326,7 +326,7 @@ static int bulk_receive(struct vchiq_mmal_instance *instance,
>  		 * committed a buffer_to_host operation to the mmal
>  		 * port without the buffer to back it up (underflow
>  		 * handling) and there is no obvious way to deal with
> -		 * this - how is the mmal servie going to react when
> +		 * this - how is the mmal service going to react when
>  		 * we fail to do the xfer and reschedule a buffer when
>  		 * it arrives? perhaps a starved flag to indicate a
>  		 * waiting bulk receive?
> -- 
> 2.47.3
> 
> 

Does not apply to the tree :(

