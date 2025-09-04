Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847F0CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 02:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkFwydJsxqdgKqOJsAZ1HDk8X8ftVkpre+cMSSd/UDM=; b=Y8Ys/LdUOcEQciExS1nIfI9ZQd
	YdVvic8h1tbjIe/H+OrhTQ4cmJLxmOH3x4bQCVH3XUIeMJi/W7uOxZOnSiDUUMVMj6qcg5dDrh4x9
	PP5egpacsp39Zej46ShKQvSQVfq+KK3f0PhN5D76VQWyi+Ket0NXEpWXJcMjy/y+RvSrKYpOVl1XM
	zIsor/Ti53Q5kHYmZmR5PIcxhNUmjjmUz7ki3DWabns8WzP2NRL6RHSuZHLB9GbbvnVyL4ZciK/q3
	tEj+O82ljb0N529wiIBy2bjgcHY2sJTHqxanmV6ZOFf+wKWb7DZHMJE6YHSgdaQVGa0KKfnrO444z
	7dF1nCgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzal-00000008Mbh-3EHK;
	Thu, 04 Sep 2025 02:20:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzY0-00000008LVD-0qbI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 02:18:01 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5841UuKo021252
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Sep 2025 02:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qkFwydJsxqdgKqOJsAZ1HDk8X8ftVkpre+cMSSd/UDM=; b=HYWdy/0/zGXNvniC
	YSpkv3GBj1r6CrCdX69ovIPoytEWNU9RERQfYcx2oTjSxWrQ7mq8T1eTnMmsmgWZ
	VTYYhktA8UPp+u2F5OfPKogforhOErJ0WP0PM5XXOU6igHHSexuX5OiEZzwPt8mg
	jS2IflRnkmp6N7BXM0Tz4p+1sf7wU6L0RuJz3V4XMNZGXSeL59g0a8Tf89XjNSBA
	0hhw0v0Ls5ul5tK4y06uwohAFQIsed+krasNFCaJobCHRcOX3V9j2Anc77/MZt/0
	kwUL5ecFYDDWunFW/R4ZbPdl1Ra8lyt/xdj38Aa1MHNhdjDqnPwOuA3Lxa/dDPNl
	pzvbvw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0enywx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 02:17:59 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-72108a28f05so14451236d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 19:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756952278; x=1757557078;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qkFwydJsxqdgKqOJsAZ1HDk8X8ftVkpre+cMSSd/UDM=;
        b=hVLulR6inkThED43QAEQmx7jD/ZLrYTDqv4/U48hDrmXdmjYruKoLa0UfbUF7DA+i3
         1yy9pKhhGjjxwd9Z9R+Ditd+/k2YnFiD249cqvChwuj7cBan+bCia2ZdBPERsb5XmqpL
         FYnTN7R40By9e7EBSxn3ulmk23alm870tUXp88fpK108duIHuvWTcJKUkmi5cf8LwkTw
         iPFuqwPFbg+sTyInm6pSEueB1YSveYqF+aJq1EnH8vvink8W81Y83xbVc1/03fRIId+7
         8M6HY2xVYY0Ivd76xaox3xE8PrAk/V0MrS9W8KlHGeCmOfX2Tvs/KlTjXXKi1l3kEjI2
         0LhA==
X-Forwarded-Encrypted: i=1; AJvYcCWPN7OM7CpGe1g8TBUO7LG6Nea388qZIiwHywN35PaPmWfQh5hEq7hvEoc3nszSMrVgppXDi2/oU0V/3OjS5vPi@lists.infradead.org
X-Gm-Message-State: AOJu0YwcYNjg9hO/g9sbQ7Tv8sudTIVb/CK4SXJRe69Ooxw08Gm8aHY8
	CISjLOzrAkS1ZrBeIuDi4HahfsVbcKQh4LZK7hOQTf6zVVCUThN1FD924YAV/1igM21XBt5/tpH
	hImzrB+6UmA/Huui8oCN+BE5HAK6cQQ5GeEQvFjaJIgG7MDxuSIMhE/53DdQ8VL80qEzGbEJhtY
	EOlQ==
X-Gm-Gg: ASbGnctZc7j+HK4FLU6vrZvccMjEwEwfuMA0qNjWWcuKPz77QxQDGm2wqB47KlrzlDj
	/erSkVxPmOOpApYEyBjTcY3eMXRYBMt31zypQ008clIhSgScK4jIIpwWLA5XJvIorMwTL0UJeV3
	NHZJQGlpCq0PEj2C6/vglyTjuP5CzptywNwD3lv2Qv/uEbTe5NJKnluv8XAnCtNjOAfQ8z6TRso
	RSjtzmrNvTnK06oziXm+8+7n74F7R70jcsiKnj6TxIyDi5kJjyXaPk0B8jbfkLjAvnYLm4SrU7Q
	E9XVBaJNNvQzoNNSEeWavs87oewgpWBbGAN+4PwSHohP/WhMuJngrRZcAZl/o9dVHpQnJmDeXXw
	hvqVAGPxg9cygxbumK380ecvAQ0MKP7wb1JE5cP79qmEFN7d/BMkq
X-Received: by 2002:a05:6214:501d:b0:712:e30b:ef1d with SMTP id 6a1803df08f44-712e30bf1f3mr189032776d6.63.1756952278170;
        Wed, 03 Sep 2025 19:17:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpnx/oWiqnFeeBH9c95exPgNTFpxW3/4KJo+Lqf24gUbaClGKKsJlqB65JLkcbt0YEKckERw==
X-Received: by 2002:a05:6214:501d:b0:712:e30b:ef1d with SMTP id 6a1803df08f44-712e30bf1f3mr189032376d6.63.1756952277581;
        Wed, 03 Sep 2025 19:17:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ab928f3sm863017e87.39.2025.09.03.19.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 19:17:56 -0700 (PDT)
Date: Thu, 4 Sep 2025 05:17:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Andy Yan <andyshrk@163.com>,
        mripard@kernel.org, neil.armstrong@linaro.org, andrzej.hajda@intel.com,
        jernej.skrabec@gmail.com, jonas@kwiboo.se,
        Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
        rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de,
        knaerzche@gmail.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v7 1/2] drm/rockchip: inno-hdmi: Convert to drm bridge
Message-ID: <irvff5zmeqyy7yn3idc5rr2ekx5gmpcib45rrqk2vhkt33mdy4@q346i2jkehtt>
References: <20250903110825.776807-1-andyshrk@163.com>
 <20250903110825.776807-2-andyshrk@163.com>
 <5255838.1BCLMh4Saa@phil>
 <4ox7yh3i47odinoaalzjz7d3gvx36bxbaspo6qfvvvl3jqhdiv@24ownjco3ud2>
 <aLismmDJfusG0x0Z@yury>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aLismmDJfusG0x0Z@yury>
X-Proofpoint-GUID: zDrH6fj2nWXKgxcPaM_6EzuO6jQKy7-N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX0z4XeVXUGZ96
 p8nJ4wC5Ab4bSZVovjyOU2+tR7MToveMUUDmadvI23GC5m1jEGJ3dcnm8tYr99suYbAOLoh2/dh
 nlep4bcHxDV8uAF8cfK4oVaJgZqMJFHaqAFLrctimqf8AtNxLFP8aMAUo7DWkik8ty+4L7OTHGq
 +fS3kxzN3/A2YPKnY6xOns+2wkKefSU4dl77lv86OvLAE8fUQh5uDYNbHkxcNEOsxPLyC99B85a
 j88cbErH5aMVP4cXG3dSahUmZISg6CpolPjCMqtvkK6SV02FpNqI/MVxdHTagWqp4zfNzkDpm/i
 YMUIpbSEw8XL+iPsLXAjf0VDp8w+tqNva77pnJR0vuzkXLRJ0aukddOD8YwoN5VcUVgtcsrEv/D
 mBmZIe4E
X-Proofpoint-ORIG-GUID: zDrH6fj2nWXKgxcPaM_6EzuO6jQKy7-N
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b8f6d7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=Fob2wsIVxNtBE8oepsMA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_191800_244612_8A56F472 
X-CRM114-Status: GOOD (  33.20  )
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

On Wed, Sep 03, 2025 at 05:01:14PM -0400, Yury Norov wrote:
> On Wed, Sep 03, 2025 at 03:30:47PM +0300, Dmitry Baryshkov wrote:
> > On Wed, Sep 03, 2025 at 01:59:51PM +0200, Heiko Stuebner wrote:
> > > Hi Andy,
> > > 
> > > Am Mittwoch, 3. September 2025, 13:07:38 Mitteleuropäische Sommerzeit schrieb Andy Yan:
> > > > From: Andy Yan <andy.yan@rock-chips.com>
> > > > 
> > > > Convert it to drm bridge driver, it will be convenient for us to
> > > > migrate the connector part to the display driver later.
> > > > 
> > > > Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> > > 
> > > more like a general remark, this essentially conflicts with the
> > > big hiword-cleanup [0] that was merged today, as the inno-hdmi driver
> > > "lost" its separate HIWORD_UPDATE macro in favor a nicer generic one.
> > > 
> > > I'm not sure what the best way to proceed is, apart from waiting for
> > > 6.18-rc1.
> > 
> > I'd say, the correct way to handle would have been to:
> > - merge only FIELD_PREP_WM16 addition into bitmap-for-next using
> >   immutable tag
> > - merge the tag + all other patches into subsystem trees. Otherwise
> >   that series can cause a lot of conflicts with all affected subsystems.
> > 
> > Yury, would it be possible to implement this plan instead of pulling
> > everything through your tree?
> 
> Yeah, this is 100% technically correct way of moving things.
> 
> The problem is that driver maintainers are usually not quick taking
> this type of changes. In my experience, if we merge #1 only, we'll
> end up with just another flavor of HIWORD_UPDATE(), maybe adopted
> by a couple of drivers.
> 
> This is exactly opposite to the original goal of the series: nice and
> almost complete consolidation of scattered HIWORD_UPDATE() versions.
> 
> So far, there's the only conflict with the others, and Andy said he's
> OK to hold his series.
> 
> I would prefer to have all those patches in bitmap-for-next for a while.
> If there will be more conflicts, then yeah, I'll follow your route.
> Otherwise, let's keep things as they are, and encourage developers to
> test their patches against linux-next, as they normally should.

Ack, thanks for the explanation.

-- 
With best wishes
Dmitry

