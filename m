Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C8ACCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 12:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNsUbT10s5zSfVe/NID+AupK44Pimf1cna/+6kSnqDA=; b=htyTzvw00mpKqttNkXnG0LqhQ8
	uKmxfAODdYisEvT0vkkmrdLI+QT0dgjTK7QFuYd5ZqbcaPRLRoRoBOCmt7k5bIf3PdFFtz78JY0/z
	4/bALeQ8xqLYwPx5gOFd+zkM2tk26AUAy++ArmpE+7hOgtEw0XKtGoG2iUgw5roEyDE//RDWlWJoY
	wjf79qPypXTHdL6+avhDW3VxB4knKKFNvlMoeXESqfzF+lFSx/1tCHM0tNYkB9Juzsq+GnrXugtuh
	96DLlSy2xetYnmrYU+PwHd8NZeR8ymeiQ5ZtuM2ab9y8ApTE0s8q+LtsIqg+16bHBE+6GeEthQuF9
	yVgxuX8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7CSi-00000008TFH-3nk2;
	Fri, 10 Oct 2025 12:43:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7CSf-00000008TEC-2c72
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 12:43:07 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A6Wgrb027202
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 12:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VNsUbT10s5zSfVe/NID+AupK44Pimf1cna/+6kSnqDA=; b=VJ6CoIt95oBJ80un
	2gMnh/GiQqHK97PV63qSektfmunXEeLtZZ12JITb+nGjrCeiA6CSo00VxOiRUBVM
	PZNq7xieoiKe3XKvYIPVK8NgJbZ90ZvVYUVeCJsjULHQArMP1TOHURivkT7Wt170
	B/vM2wNagv20ShNkRKLKExcvNL3pZS7iLggZMjf74RLRr7oJxHGU4+/qG/+KW5Uv
	kGDkYD2KO2ieu6qrOSzO708popFfV1xpgShF5/eFDgj2ZDz6ScjAQtPH/cKTfZ/Z
	Tr5ikGxlPTAGH/9V+DB3jjS/yAIXl2aeGF25DjTA57F+En0cVJAC73oxwxAb74Ie
	HsYqnw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4npdsb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 12:43:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4df80d0d4aaso92151461cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 05:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760100184; x=1760704984;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VNsUbT10s5zSfVe/NID+AupK44Pimf1cna/+6kSnqDA=;
        b=ZtaomtCdSQtowfDzo6M/pKTUHf6WmwJSrVFG+eo1aU2JFuaxc/7/rh5WJurjmi7Fms
         6UPviskk0OiKF/5Qn5CZB0l8V3bS5d4CBCQO5B6ht0kmHqx3bKQ9UGd2DOrmaEsl/ArI
         UqgCdkUNCEj5g5qDDAFPVkDdR7Kyqs2L5vFl0k0ddVUDnyjNbQLR6dCfBJy474/hhInC
         fX5MjQ6Wd7WC8uWK5suR1GpYRaUYf2Vcbd/06/12ccCxjRwJhfVcxakT9jwFnlGHxlL5
         J1GN5sXdbhz1H0yoGUHdfGewL9bfBMafKO0UBdeWRX85CFxh/q/xJwBAkMtZ3kQt+cxP
         S5mQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7kV66Vh0tJhBTXLHB3/dQWIm457b7KcLFcxIZOeKXolCiwgLJfn0IkrC4wxFTfGFMBDiyDrAoKrzi+NO3hwqW@lists.infradead.org
X-Gm-Message-State: AOJu0YwBVTcY0osV+6sTqN/ZCrAOWiTQugpC1uPD6iwLCedbG8oAm2MS
	7rADXFG9Dfce6bIiU0P/q3Mny+lve94fZn9lMJEo0yDSP7y2Nkh1j2pI5HeN15nHb6KjwOdWmwZ
	B4hHfzGMiCCRrOVdUnKAQxJPm0lAV8jypHfNE/iJuyqmNaR108j/6nldGlOPqEMR4cPLQUvwT9n
	txow==
X-Gm-Gg: ASbGnctDKdXgyg5MTpQgdeFddz7BprEP+SnsUM8Lb0PFwF1V3NzYclCwBhWFzlSy2Lp
	6zhjXMeXP9vh+ksoIt1rNoOu2GPiJMlMEz2oreh4ZLcEDPNmLxvIqTJecaj0VbcrXkPCD8d4+xi
	sYUj3YDrNhZQYa5Lmtdxrc0j2medHjhX4cX5+SDtLKpw9N4ydB1zXsGrJ5fCmxobNNqcY4ClLoh
	81kc1+ZpTkOqO/jrkcSf+jXmpO7g8bmiXWhOyb1Qw4vfIrJK9nrDlFcjhE6J+xMuXjJrIDBh8E+
	w/ooc5Unq5y3447HHwZZaPmp/aO0gUEyPQ/lofdoJ9kcM5n/0Y1dynsvmsPMjWKVbte/8QklnO3
	RII82K86UZarjcC+m4ojeGJ9WaV0sXiqFAanz3UoPM1ln902CO/xz
X-Received: by 2002:ac8:7d0a:0:b0:4e4:beb1:73d4 with SMTP id d75a77b69052e-4e6eacf551amr173804511cf.31.1760100183547;
        Fri, 10 Oct 2025 05:43:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1ZudeCrHVqgLFSFdYWiioumPJG3NkOroOV8K0GCBnWR2pTMVmS9VaAdEuh0dVymq3W77cGA==
X-Received: by 2002:ac8:7d0a:0:b0:4e4:beb1:73d4 with SMTP id d75a77b69052e-4e6eacf551amr173804061cf.31.1760100183037;
        Fri, 10 Oct 2025 05:43:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea3aafasm6103321fa.49.2025.10.10.05.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 05:43:02 -0700 (PDT)
Date: Fri, 10 Oct 2025 15:43:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, m.szyprowski@samsung.com,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] drm/bridge: analogix_dp: Fix connector status detection
 for bridges
Message-ID: <wzeleliof47ogogxqrlwswfbnvummoydtegpgwf463k5ve3uue@tpemjilgagpl>
References: <20251009193028.4952-1-heiko@sntech.de>
 <v6aqic6kffc3x42dkb4bika5tvoqdpmmloroqio2656g74pkws@7fe3bsfzbasn>
 <3572997.QJadu78ljV@diego>
 <b47c5579-511e-4831-b86e-48ad4cefaa6c@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b47c5579-511e-4831-b86e-48ad4cefaa6c@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX0oW9ynFW0yfe
 bEgk2nrbSvOmAvQR6FTEcIiMjRrFmhz7WspWZ+7HF5D2QVoAXqQKD/0UhzUigXobk/C1vrbh2jn
 Eic3WH9D+LjAGxFAH+88FKLnPsnw8S4xTnXxab3JHnAV4nxpqahIQUIOGLmXTksLE2Sk0h5bNAZ
 PYPVsZH3nCjbsBW8dSiPUnbzSMsjoQCxMGYhQlbH115V6f9uoXAsWI2D2EwacTDbLaK3Gq0gGLi
 23uTSI1G9jvhZSSzRC6V7a6NSfEn2nsLKFSbQIkd8VAQjOX/EexitYNuE/o+NAKLQhabtgKf5ub
 P/LY7QrddaCUBcfEqPdNnYuE0jb3/leombeOOiTrBM/Xy4FdXRwxR7jwWPahzJs8lHHMW0RKjX5
 Tau4UTZVbic7yQbD/mbJf+IeoHtfRQ==
X-Proofpoint-ORIG-GUID: CQPTn11mTsvv-wfe5apxmwwy5jEV02eI
X-Proofpoint-GUID: CQPTn11mTsvv-wfe5apxmwwy5jEV02eI
X-Authority-Analysis: v=2.4 cv=VK3QXtPX c=1 sm=1 tr=0 ts=68e8ff58 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=s8YR1HE3AAAA:8
 a=V7SD_xnUNx52fGP0aLEA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=jGH_LyMDp9YhSvY-UuyI:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_054305_953894_80AE23D4 
X-CRM114-Status: GOOD (  64.19  )
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

On Fri, Oct 10, 2025 at 12:02:43PM +0800, Damon Ding wrote:
> Hi,
> 
> On 10/10/2025 7:42 AM, Heiko Stübner wrote:
> > Hi Dmitry,
> > 
> > Am Freitag, 10. Oktober 2025, 00:30:11 Mitteleuropäische Sommerzeit schrieb Dmitry Baryshkov:
> > > On Thu, Oct 09, 2025 at 09:30:28PM +0200, Heiko Stuebner wrote:
> > > > Right now if there is a next bridge attached to the analogix-dp controller
> > > > the driver always assumes this bridge is connected to something, but this
> > > > is of course not always true, as that bridge could also be a hotpluggable
> > > > dp port for example.
> > > > 
> > > > On the other hand, as stated in commit cb640b2ca546 ("drm/bridge: display-
> > > > connector: don't set OP_DETECT for DisplayPorts"), "Detecting the monitor
> > > > for DisplayPort targets is more complicated than just reading the HPD pin
> > > > level" and we should be "letting the actual DP driver perform detection."
> > > > 
> > > > So use drm_bridge_detect() to detect the next bridge's state but ignore
> > > > that bridge if the analogix-dp is handling the hpd-gpio.
> > > > 
> > > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > > ---
> > > > As this patch stands, it would go on top of v6 of Damon's bridge-connector
> > > > work, but could very well be also integrated into one of the changes there.
> > > > 
> > > > I don't know yet if my ordering and/or reasoning is the correct one or if
> > > > a better handling could be done, but with that change I do get a nice
> > > > hotplug behaviour on my rk3588-tiger-dp-carrier board, where the
> > > > Analogix-DP ends in a full size DP port.
> > > > 
> > > >   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 8 ++++++--
> > > >   1 file changed, 6 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > > index c04b5829712b..cdc56e83b576 100644
> > > > --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > > +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > > @@ -983,8 +983,12 @@ analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *conne
> > > >   	struct analogix_dp_device *dp = to_dp(bridge);
> > > >   	enum drm_connector_status status = connector_status_disconnected;
> > > > -	if (dp->plat_data->next_bridge)
> > > > -		return connector_status_connected;
> > > > +	/*
> > > > +	 * An optional next bridge should be in charge of detection the
> > > > +	 * connection status, except if we manage a actual hpd gpio.
> > > > +	 */
> > > > +	if (dp->plat_data->next_bridge && !dp->hpd_gpiod)
> > > > +		return drm_bridge_detect(dp->plat_data->next_bridge, connector);
> 
> I have tried to use the drm_bridge_detect() API to do this as simple-bridge
> driver, but it does not work well for bridges that do not declare OP_DETECT.
> 
> Take nxp-ptn3460 as an example, the connected status will be treated as
> connector_status_unknown via the following call stack:
> 
> drm_helper_probe_single_connector_modes()
>   -> drm_helper_probe_detect()
>      -> drm_bridge_connector_detect()
>         -> analogix_dp_bridge_detect()
>            -> drm_bridge_detect()
>               -> return connector_status_unknown due to !OP_DETECT
> 
> However, the connected status will be connector_status_connected as expected
> if Analogix DP does not declare OP_DETECT[0]:
> 
> drm_helper_probe_single_connector_modes()
>   -> drm_helper_probe_detect()
>      -> drm_bridge_connector_detect()
>         -> return connector_status_connected due to CONNECTOR_LVDS
> 
> Base on Andy's commit 5d156a9c3d5e ("drm/bridge: Pass down connector to drm
> bridge detect hook"), the drm_connector becomes available in
> drm_bridge_detect().
> 
> It may be better to unify the logic of drm_bridge_detect() and
> drm_bridge_connector_detect(), which sets the connected status according to
> the connector_type. Then the codes will be more reasonable and become
> similar to the simple-bridge demo via
> 'drm_bridge_detect(dp->plat_data->next_bridge, connector)'.

I'm not sure, what you are trying to achieve here. The
drm_bridge_connector should handle the OP_DETECT and use the last bridge
in the chain that supports detection.

Note: OP_HPD and OP_DETECT are not that tightly connected, especially
for DP bridges. It is fine to have a later bridge which generates HPD
events, while Analogix DP bridge responds to .hpd_notify() events and
performs its duties.

For example, it's perfectly fine to have dp-connector with the HPD GPIO
pin routed to the connector (in which case it will declare OP_HPD). But
the Analogix bridge should perform actual detection. Normally this is
handled by reading DPCD and ensuring that there is an actual connected
device (i.e. either a non-branch device or a branch with at least 1
sink).

> 
> But we still need a specific check for DP-connector to resolve this issue.
> The '!dp->hpd_gpiod' may not be well-considered. Perhaps we could introduce
> a new API, similar to drm_bridge_is_panel(), called
> drm_bridge_is_display_connector()?
> 
> > > 
> > > And it's also not correct because the next bridge might be a retimer
> > > with the bridge next to it being a one with the actual detection
> > > capabilities. drm_bridge_connector solves that in a much better way. See
> > > the series at [1]
> > > 
> > > [1] https://lore.kernel.org/dri-devel/41c2a141-a72e-4780-ab32-f22f3a2e0179@samsung.com/
> > 
> > Hence my comment above about that possibly not being the right variant.
> > Sort of asking for direction :-) .
> > 
> > I am working on top of Damon's drm-bridge-connector series as noted above,
> > but it looks like the detect function still is called at does then stuff.
> > 
> > My board is the rk3588-tiger-displayport-carrier [0], with a dp-connector
> > which is the next bridge, so _without_ any changes, the analogix-dp
> > always assumes "something" is connected and I end up with
> > 
> > [    9.869198] [drm:analogix_dp_bridge_atomic_enable] *ERROR* failed to get hpd single ret = -110
> > [    9.980422] [drm:analogix_dp_bridge_atomic_enable] *ERROR* failed to get hpd single ret = -110
> > [   10.091522] [drm:analogix_dp_bridge_atomic_enable] *ERROR* failed to get hpd single ret = -110
> > [   10.202419] [drm:analogix_dp_bridge_atomic_enable] *ERROR* failed to get hpd single ret = -110
> > [   10.313651] [drm:analogix_dp_bridge_atomic_enable] *ERROR* failed to get hpd single ret = -110
> > 
> > when no display is connected.
> > 
> > With this change I do get the expected hotplug behaviour, so something is
> > missing still even with the bridge-connector series.
> > 
> > 
> > Heiko
> > 
> > 
> > [0] v3: https://lore.kernel.org/r/20250812083217.1064185-3-heiko@sntech.de
> >      v4: https://lore.kernel.org/r/20251009225050.88192-3-heiko@sntech.de
> >      (moved hpd-gpios from dp-connector back to analogix-dp per dp-connector
> >      being not able to detect dp-monitors)
> > > 
> > > >   	if (!analogix_dp_detect_hpd(dp))
> > > >   		status = connector_status_connected;
> > > 
> > > 
> > 
> > 
> 
> I see... There is also a way to leave the connected status check in Analogix
> DP bridge:
> 
> 1.If the later bridge does not support HPD function, the 'force-hpd'
> property must be set under the DP DT node. The DT modifications may be
> large by this way.

Well... The drivers should continue to work with old DTs, if they did so
before.

> 2.If the later bridge do support HPD function like the DP-connector, the
> connected status detection method is GPIO HPD or functional pin HPD.

dp-connector should set OP_HPD
analogix-dp should set OP_DETECT

> 
> With the DT modifications for above 1, the analogix_dp_bridge_detect() can
> be simplified to:
> 
> static enum drm_connector_status
> analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector
> *connector)
> {
> 	struct analogix_dp_device *dp = to_dp(bridge);
> 	enum drm_connector_status status = connector_status_disconnected;
> 
> 	if (!analogix_dp_detect_hpd(dp))
> 		status = connector_status_connected;
> 
> 	return status;
> }
> 
> Best regards,
> Damon
> 
> [0]https://lore.kernel.org/all/22a5119c-01da-4a7a-bafb-f657b1552a56@rock-chips.com/
> 

-- 
With best wishes
Dmitry

