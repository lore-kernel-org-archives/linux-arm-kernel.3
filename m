Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98672D49205
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 10:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFs0d2lavC3ECpYs/xQge9bFMjrKXTeFlsBTo6eIScw=; b=OTxlBPC/j/ui+uDN6jDDXzcz5C
	DHchVGiLxW1lZIxjaBX4+91zU9RN/JfvceXwuVTSebA6RNGOcBmMe2Hyg3Pgz0enJh/2wkNdnEdUA
	30gB3LzVXJ1eZdqigTgYmqIc1AZwNBeiGfug6Dd6Xv149I0wO0Rb71LvjwcUdbEzZqmKGj0GYbIlh
	YoAddGUclfLFhOGeABU7sVuer6BKPDIOpmaBocDuxkhOnw4+lnuKas162y3capGvtPe81EhG2hCnX
	so3+Us0uFhyvvwG+MAHyhIIHkj+JhaASRtgkYNNXQyVG+uYXO7vs2sqf+yOSwA/e2HpJWMF/rS4bz
	U2NldTMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCyrB-000000093du-0Srb;
	Mon, 18 Nov 2024 10:19:45 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCyqE-000000093V0-1bLx;
	Mon, 18 Nov 2024 10:18:47 +0000
Received: from ideasonboard.com (net-93-150-224-74.cust.dsl.teletu.it [93.150.224.74])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24B058FA;
	Mon, 18 Nov 2024 11:18:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731925107;
	bh=IT22R0CGEdHu/u1Hhsz/PwFkorUmlTbDsfnhTMv07Ho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ij2bzZwZUD2nInjP708QqKUk36/I/PUsGVnk+AhErh3b50lWTbeUITDzc0Dn4BtQy
	 cQ6jD+issSReS/corYwZs1Q2rLzLjind3kRZPqd9F6Q+DCnbJVxGDk+X19FIVw6R4L
	 ck+r3Vy/eKxSXvIOjQUTWrfzft+8OlLpG6aAHw+A=
Date: Mon, 18 Nov 2024 11:18:34 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Cc: dafna@fastmail.com, laurent.pinchart@ideasonboard.com, 
	linux-media@vger.kernel.org, mchehab@kernel.org, heiko@sntech.de, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 media-next] media: rkisp1: Fix unused value issue
Message-ID: <3obha26vg2agtmrxjft325ifiwyaftqchgpdgmm7aok7vt7e5c@jfknj6opiudo>
References: <20241118093721.55982-1-dheeraj.linuxdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241118093721.55982-1-dheeraj.linuxdev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_021846_556270_1E8BB73C 
X-CRM114-Status: GOOD (  20.11  )
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

Hi Dheeraj

On Mon, Nov 18, 2024 at 03:07:21PM +0530, Dheeraj Reddy Jonnalagadda wrote:
> This commit fixes an unused value issue detected by Coverity (CID
> 1519008). If ret is set to an error value in the switch statement, it is
> not handled before being overwritten later.
>
> Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>

Indeed there's something fishy here, however the issue is not very
much about ret being overritten but rather the error condition

	fwnode_graph_for_each_endpoint(fwnode, ep) {
		switch (reg) {
		case 0:
        HERE   ---->   (!rkisp1_has_feature(rkisp1, MIPI_CSI2)) {
				ret = -EINVAL;
				break;
			}

			break;

		case 1:
			vep.bus_type = V4L2_MBUS_UNKNOWN;
			break;
		}
        }

breaks the inner switch and not the for loop.

I would
1) Slight reword the commit message to make it about missing an error
condition
2) Add a Fixes tag
   Fixes: 7d4f126fde89 ("media: rkisp1: Make the internal CSI-2 receiver optional")
   so that this is collected in the stable trees

> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index dd114ab77800..9ad5026ab10a 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -228,6 +228,9 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
>  			break;
>  		}
>
> +		if (ret)
> +			break;
> +

The change is correct
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>  		/* Parse the endpoint and validate the bus type. */
>  		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
>  		if (ret) {
> --
> 2.34.1
>
>

