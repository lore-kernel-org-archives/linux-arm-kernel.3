Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC50D62057
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 09:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPExtlge3msjkZF91Z4CEG8tmqsBNvouLTtNJroiSf4=; b=j4E33/F2/mdMbx+8L4uTaPmBiD
	YmAl1OKX7MLlqRnDaN/e4NhzZNyhqLyf4HBlt8CwGMI1OqgM5GYkTGXW5GlGTyLT8kqu3E9bKjNcY
	D0P5OwfJB6qY9I6zaajhA0zzMbMyoEdxXH37KJkzDw6oQ3buw3jNZMefThRpwJguc3WfdTRudUP9g
	uO0wvnGfmSfwU1tgWDe0ZgNct5++nX9q7LqqNbjX/9R3v/SCRkprS1DIYNraS7t5KvUUsVrEjdAz8
	90+u73Lwjv8tJR+RwsX1MhWnAdKCu28OXZT61qPqUYjbvGN+24CqSukTdlyGHzXlK2FTXrOtPan6K
	amf8FTVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDKdp-0000000BuMp-3Qka;
	Tue, 19 Nov 2024 09:35:25 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDKct-0000000BuD5-0bi5;
	Tue, 19 Nov 2024 09:34:28 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20e576dbc42so43278095ad.0;
        Tue, 19 Nov 2024 01:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732008866; x=1732613666; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pPExtlge3msjkZF91Z4CEG8tmqsBNvouLTtNJroiSf4=;
        b=XjxF89ayLVj2adZP48kdh+TwAeUAYKkYiwSybT15r9CplLGJ50PZWvbXP7U+eiHSZR
         3ftc7pRdsDdYtKWM/JI4BpssBAC9lkBwDTbRWh3SIjgNXfGYrW5PWr5viVdw5350u7cK
         YroINo2KETf0Ih+poJsblww/G3GuRhF8JDM3GFkoRi+5+vyooxD79QqoX17WzgqXLVN4
         QfzFpedNfI1B8NTX0Cj+AHK0LEzh+zk8gl8/eXGfeeGnOQNz6ufbTcXFEINQJ9PygeY4
         2mkTfQgjeTNfaR5weNSw8Frv3AwdGNaEVdq9GlshFKZ9r3Y0byF3ig8e8MXjoeYNbH6L
         y2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732008866; x=1732613666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPExtlge3msjkZF91Z4CEG8tmqsBNvouLTtNJroiSf4=;
        b=VBJTOT4RCgQPpA6CKRSYvLL6Jorrcw6KzgogSoWpHi+QAZiXEz7GbTSYuOkpIgUzFt
         MBOlPFfk6egvrCPj+bPP8sk3fEpMxJGSHNZZzAtDowBZJnSyf0cTRoKD8J44WJmik29c
         GzdQ7Pkmk6tTZRj7LyX5XSpgJYzUOLOMRf2Tb9qVs2sMOCSGaJs/a5cov21AWB4rLoED
         2hYRsWS/C0HcfE+tEcILA3JyACz0KmrQBXB7b6BtVgNNLRhDVzExfoQnbWg3EqiBUOp+
         gdQQx2+ICt1Pylmkt3XdQTdUUxjtcbMO5C/nyU8Ej9WWDfdvTTU6vuMlbQxAdI6o7UaP
         RSnA==
X-Forwarded-Encrypted: i=1; AJvYcCVUuih4DYfky4SHhVY3DyNukhDEDDiO6vyRRV19e6UId+tUA2HQ2vb71CYjPOwT6gZrhg+KjtBlmSQ7yURN/CcJ@lists.infradead.org, AJvYcCWQfyfcYW6C0rVnF1fQDBfWldEce1re0o1pPoglo29rC/7fbe4lz2Yyi1uzsNupNAC4AeaWlBTj0z2H+hsNSlk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxszPqFIRKFP8A4C7nbkQATxfVA9pByQPOeslnKumgasrd2VowI
	RuVpFQ3NGoljRscMH7lnoMXtNBHw8xM587EcKV76NYoHl9M7FS3g
X-Google-Smtp-Source: AGHT+IGk0ioib0jianP/JWeRLCWZdzMBOeRSZzyDXcvD2UaEgV8gbzUU0BUTO/h3v2TJ3Zgql38YQA==
X-Received: by 2002:a17:903:186:b0:211:e66d:7450 with SMTP id d9443c01a7336-211e66d78d8mr206006795ad.32.1732008865846;
        Tue, 19 Nov 2024 01:34:25 -0800 (PST)
Received: from HOME-PC ([223.185.132.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-212134ab989sm38763335ad.17.2024.11.19.01.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 01:34:25 -0800 (PST)
Date: Tue, 19 Nov 2024 15:04:22 +0530
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dafna@fastmail.com, linux-media@vger.kernel.org, mchehab@kernel.org,
	heiko@sntech.de, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 media-next] media: rkisp1: Fix unused value issue
Message-ID: <Zzxbnkq86EKEWwFf@HOME-PC>
References: <20241119072653.72260-1-dheeraj.linuxdev@gmail.com>
 <20241119075944.GA31681@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119075944.GA31681@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_013427_184718_5ABEE4A6 
X-CRM114-Status: GOOD (  30.71  )
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

On Tue, Nov 19, 2024 at 09:59:44AM +0200, Laurent Pinchart wrote:
> Hi Dheeraj,
> 
> Thank you for the patch.
> 
> On Tue, Nov 19, 2024 at 12:56:53PM +0530, Dheeraj Reddy Jonnalagadda wrote:
> > This commit fixes an unused value issue detected by Coverity (CID
> > 1519008). The error condition for the invalid MIPI CSI-2 is not
> > properly handled as the break statement would only exit the switch block
> > and not the entire loop. Fixed this by returning the error immediately
> > after the switch block.
> 
> The patch doesn't "return immediately". You can write "Fix this by
> breaking from the look immediately after the switch block when an error
> occurs." or something similar.
> 
> > 
> > 'Fixes: 8d4f126fde89 ("media: rkisp1: Make the internal CSI-2 receiver
> > optional")'
> 
> The Fixes tag should be formatted on a single line, without outer
> quotes, and without a blank line between it and the Signed-off-by line:
> 
> Fixes: 8d4f126fde89 ("media: rkisp1: Make the internal CSI-2 receiver optional")
> 
> > Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
> 
> I can update the commit message when applying the patch, there's no need
> to submit a v5, unless if you want to. Please let me know if I should
> take this version and update the commit message, or if you will send a
> v5.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > ---
> >  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > index dd114ab77800..9ad5026ab10a 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > @@ -228,6 +228,9 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
> >  			break;
> >  		}
> >  
> > +		if (ret)
> > +			break;
> > +
> >  		/* Parse the endpoint and validate the bus type. */
> >  		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> >  		if (ret) {
> 
> -- 
> Regards,
> 
> Laurent Pinchart
Hi Laurent,

Please go ahead and take this version and apply the patch with the updated 
commit message.

Thank you and Jacopo for your valuable comments. As a new contributor, 
your feedback is extremely helpful.

-Dheeraj

