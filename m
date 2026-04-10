Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8B6F36BAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 05:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D2xvwUO/cl/StS4bWMsNZCSZ0+Gyr4+of+Oz/06a/Iw=; b=uOnjtlNQGQ4ff6rZN/5A2opLAM
	vHvbZjwar4obXjsmvZ66nKB4Z2cVOvVrnXM1QmnnqZOs91Ug+X2mE2FpyKWk+9KpOJ4IaJok+kJEe
	7Kk5he9R1u6MihjVlYAm2KhfDdQjNlsQ+8Bk8uy5eT+qO8JoqWNqfvQ8QvK2eRVrd7l/6bD9/EwPI
	R0LHY26faPnR0FiteSp8cATJgTjFOyxWrY01SQ/M2jy+7LHB+NXCXDlbxsMUhEIQr4uoxrnFBoIS1
	SC7NBXjYnr09XIN7vXTh09DR5ZIzzr0m9+VjWH9NqNGK3xX50M2ai5BWU5KHd4tnhbp8uZzwS0kqf
	+/qiPwtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB4Tm-0000000BdWF-1CjE;
	Fri, 10 Apr 2026 05:32:30 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB4Tj-0000000BdVP-35bp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 05:32:29 +0000
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D7609348;
	Fri, 10 Apr 2026 07:30:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775799052;
	bh=MUzr2P7i7loAzz0yoJoPeQX2W0yO5yBzzZ7X5jtgdwg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U29MyxtatjfrbAl8dAc337PS4irKqQBEEgl9XgAe0gAR6n5NB9+lLOYajaR43ueRM
	 8oI1vDH45I6jFxd5M7nspF2g7vKoN4ECowN/6qc8Bn+eGNusEJOL1UvxQ48DE5qOxM
	 XkDE8TCtk8ISZRN8hWMbbuEAsa4jTS6tIrvL5Jbw=
Message-ID: <a22cea50-780c-4012-993b-189170c17077@ideasonboard.com>
Date: Fri, 10 Apr 2026 08:32:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 02/11] drm/fourcc: Add DRM_FORMAT_XV20
To: Simon Ser <contact@emersion.fr>
Cc: Vishal Sagar <vishal.sagar@amd.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
References: <20260325-xilinx-formats-v9-0-d03b7e3752e4@ideasonboard.com>
 <20260325-xilinx-formats-v9-2-d03b7e3752e4@ideasonboard.com>
 <aocdbgbLe5WhUEOGeLg3P7fRDM8i72H9zBuUnoAjjsuvBLfMPofrPtaUEjII_43KXf1wCbv1G9UutJKMkWLaEcBSnrlUV78Wrhu6l_Z0xi8=@emersion.fr>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <aocdbgbLe5WhUEOGeLg3P7fRDM8i72H9zBuUnoAjjsuvBLfMPofrPtaUEjII_43KXf1wCbv1G9UutJKMkWLaEcBSnrlUV78Wrhu6l_Z0xi8=@emersion.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_223227_920844_A8D673B8 
X-CRM114-Status: GOOD (  13.88  )
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

Hi,

On 26/03/2026 16:26, Simon Ser wrote:
> On Wednesday, March 25th, 2026 at 15:02, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> wrote:
> 
>> XV20 is 2 plane 10 bit per component YCbCr 2x1 subsampled format. XV20
>> is similar to the already existing P030 format, which is 2x2 subsampled.
> 
> I don't know for sure the multi-planar YCbCr format name scheme we're
> using, but here are my observations looking at P, Q and S formats:
> 
> - The first digit indicates sub-sampling. 0 for 2x2, 2 for 2x1, 4 for none.
> - The two other digits indicate bits for the Y channel, one of 10, 12, 16.
>    One exception: Q401 indicates reverse order for Cb and Cr planes when compared
>    to Q410.
> 
> P030 is a bit of an outlier here since it's the only one with multiple
> Y samples. NV formats are also multi-planar but seem to use a completely
> separate scheme.
> 
> Given the above I'd say what would make most sense to me is to use P230:
> keep the last two digits and change the first one to indicate that the
> only difference is the sub-sampling. Does that make sense to you?
I'm fine with that.

  Tomi


