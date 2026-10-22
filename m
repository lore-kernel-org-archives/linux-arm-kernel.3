Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E36A606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 13:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r1KIt8TF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=jG8Io/Sw;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CZeVLEBj;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hDsPAZK5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=; b=r1KIt8TFY5H9Bp
	Payz0k8aA5lu4M0I+8TCMOExkNzA55OATFr1moq4xS1LPqvy49PrPw1ciJUnT9a7ilXwdXONGyBQB
	m+53aYAS7nNwrBfvD0GQ8B9rn65H1AU9PmqkzsVwS1w2tPzRiUs/oHEaucxtwDaFJCkGH+JUxmxJG
	8oEHhO/YljiBhMdO2AH7dXD/jlXPkKXcpTZLWtFn5BwsweTNpBAakT3tfKv+1CBx3QoUkbDIflDL8
	/Ozm5OPdgl9ujc+QNUz1oVQIHHjY10KKkBxffjK3uQHdxdnOXUdF31xCBgL8SE7G1idlQ5OKfUfnF
	g5TinklL7EcyEDchvSmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqf-0000000EBmP-0GsU;
	Thu, 22 Oct 2026 13:28:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqT-0000000EBWt-1KWa
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 13:28:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=; b=jG8Io/Sw9MKKBEJVKzf8sBIouj
	FoL+tFBSg/v8k60qaAR8FjTxKxssUO+VwJdukynIkndhNBrXlSufBQR2wxhu9DJI2swUP9BqbQGzP
	5f3bfwVPG/p7BXY0mvACfLsYu3O+YRlwpuHIDuTcFKYAkaY2AMmMqK0nBjy632LCpnRlwEY+2Bgb5
	lwSDd532qchv5fdL1yn4OFWWA7U3pALzp4PoUkcoIWJl7JDIHV9uS/FdmXFiAgYM3NRD72QqOnqPq
	f82B+/zwTqkQr/jBtfdsECr4PcvKEGXMI/9hsiKT4YpJ78DC/6f+ZoWU2IVfsdlBEYxemYZLW/Fut
	5WC0FdSw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsqN-00000007Bhi-1ZWo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 13:28:36 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MD0wIk3898389
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 13:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=; b=CZeVLEBjvIzXrdp6
	zNw2wVWiVgTpKCuap4rZ8nsMAD6kvXwxI6y7tAIpX9cFwskWJuBu4UADQJEcuFxR
	U1zWyh1NfibE0s5kX7xA/LMUmfeXap8Jz956NFBzEUUYH0lCbq7uuXxoL98J9SDQ
	ZSIA0q8ti6SVppbUHO5aXVjbt/eaTaZE6UISVh1jpCN2QCxaietQCgoCFD+6aAko
	Vc+bONyAw/zoLfxEvtSLaLo8sy+qqpLljUOSYKJYVa7OO8yKjaIgyfGXVleoC22p
	MZ1Q9OzwT4IlHXhVjGXqbpac21/MjbeSwpbD4Bu1999+rVbg1iLAyf0PXX4Ju0JN
	lF+8lw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93auqke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 13:28:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ce7a85f04so393031185a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 06:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675707; x=1793280507; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=;
        b=hDsPAZK58DY5FS+omveyTgJPlO3q4sK7teq5J0N1n/g3VnEogcA3yD6vG+mJDao2RK
         hw4WALqcWUns95HoNkCfXigg7jb3/+2BEamghq+SunIVBULR3Vtp1ZkKE33zyjGxxdB3
         ajpyPp2a7NGbm3phVsZombRx8wB2gzkTNN5bpKwSxEcobRJWcy85es6dOQrsEz+L5MFn
         Mn+bVHgOaIlrTJnnsdFDLHSBZgASnMljMq+QfrBlH7kdNNixA+BinEhxG3nDjQGqbhM0
         C7S5DYlmo+PwaFJvIRy+HpPwfDbmcJDAOiU5WRdN2xCTapVdm2b2ZN0D3nLn9vFMf5vQ
         P6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675707; x=1793280507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=;
        b=0GQf4RwsX79nGY4KtW/Umj2YM5w+OzoJSKojm5UKlyhQKI/EkQLG1DrpY44RnXK62K
         l6KGV4IL5HpfZ9HGMbygs8PhbW5B4C7SM6R7pI55UJ9XKgXo3IgXHGVp0OzhxOwhJ3SP
         Bv4REt7UYHNHwaWiaKeL1E+5H0zbxEAKltPS7OJlxkd9CudA+wmDhxuB0Vw33A8x/PZj
         6O+RcqXkUXifLLX09dK1VtLW4J7XYiz4eUnoMLNyP79HRT1X1+JHK9XypQapLCL70xkO
         EZYmeRox+Z04EDL3ZmXcaT3lTWcYWnEDOacNNn4LISRiSwZwcckhYfkmLUk4fSv0teB+
         RCHA==
X-Forwarded-Encrypted: i=1; AKwUvBy8wuF4YJ5OhAVrWQHdtVk4XpYHit3+UYmVv/2gyfphajSeGoreRMwiudQJ816H/w9k6smLVjoyOa0DbWZMTlLM@lists.infradead.org
X-Gm-Message-State: AFq9FYKX660EAOpTOJFbINVyD81DxQlvM2Jnxg8HMdRf/kB+6HquZ690
	lMx44ChTqHM0H7eXa8DrHTRK/qh4s/mGgfMQnQv7k7Id6xkCMGUWQW8bor0QcW754QcB5C9kx1k
	nvKpcTN2nYs7C7wd1RZ6OrYULcwrNLSX5vmGJfVD+G7UyhKbzCmeQ0lBVfDmTW325KxKxf2L2jM
	czFA==
X-Gm-Gg: AYBFou29HYlpH3nVOHCymKMD57b4iLe2YD7OIZ81/h/URDGHhQ6pNiCTlFGUrfPZhR3
	68Ud2t3xp+QKkdLkwxQC+Indlh6rsBdiKIF363SuNZn1ePW7aWdE67E4BxG4aYdXdTz8Lkg88qx
	tqoVm/OV2Q7jhHs+Qw08XkxtKtr/ctF6j+psiys/vgKxJZlWOK9+vWLMk8vE7OdrCCEVbA+Sbg4
	ZimX70gW8mMTcWD03YJb7DGAf+bWJ+8ZonZegRQGAsmc869v+wpMZdQgcB1EtahgrfMJxwpUi1D
	9r5ugIEjcCycePVQ85kfaGLrankJlEjh8sXaKx0xxHrjvtSK/NXff34B+WkvcA91/XJlwEMfYpO
	m7Z7p2PL4h27OmbUawk+YeMmfykTYjwKP7pyzdZ/XlQWwDIVYjOWXEjfQUD57mAIRIl+HOjcLep
	vx8tb3UZMqvpWG
X-Received: by 2002:a05:620a:1b86:b0:939:b099:d52f with SMTP id af79cd13be357-93f57fa0c2bmr964763685a.20.1792675707145;
        Thu, 22 Oct 2026 06:28:27 -0700 (PDT)
X-Received: by 2002:a05:620a:1b86:b0:939:b099:d52f with SMTP id af79cd13be357-93f57fa0c2bmr964757285a.20.1792675706572;
        Thu, 22 Oct 2026 06:28:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:28:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:28:00 +0300
Subject: [PATCH v6 5/9] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-hpd-irq-events-v6-5-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
In-Reply-To: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4192;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BIcHzWfG5902z+M7u42M0vyUpcn4l5zulhIbCsx30p0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2g9mw1u0Qd3LxnGa4XtQ4wMod6I5wyqNjSx7t
 HCKz5kq/4WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatoPZgAKCRCLPIo+Aiko
 1VRBCACUkpGMPsojQ3/lvQ8NRygF2i1lg6dnHEaRu8EQVPRRVWIa53q0uMadWWOGZqz0KqyGsi4
 e3ui4UA02KecreOJWaWscbiD1o//uWQlzFOv/6TEua08RyqDy5I5/1sefYM3Fr3LRPl/qXmA1Dw
 qNsQZyPGy+bei7bgQKZoVGTa1qbtAAfLFqQy4lLrjdsma70Dtowl+OmBmq7NdNH1SsFzQUosJ7J
 77O4afqIMKLgcq03RDbuMOdMltfXZRflGuGUM1jRUYO4qMY/BkpberJF0/5UheSZaZQJ9ZMBVj8
 tIbuROk2cB61iFAkifJ9LQeJdEnnEOVv/pbf6WMLnnRXao5B
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX/tMtum8q8VvD
 g3c5slyx8Tbcb61DH/vYuzqXLthdVcGKFb2P0rbPKJh5EBjC5DR1WgU0C2JYDxluylPTCMhB8iN
 CBH6SSSqQewysvruZ8nYpfArg6VlNFOhWN3bPU8Z5z63CpwMcExGlPgub1yymMPs7drm6vlE8wX
 bqCtJXNYeuPFa23KQGrKRsS7psdqEz+1WZ+dBxkAFbY3iohHyhsqnfboYcTTVpj7lgGCRJ9vNZl
 ryd7xXViAFj2F8LqBvObmQaeaL7WV4fXOzlKGzyuTM7lCh8F77L6141P1Z8oiXvDnzps6Modnft
 Oh9eR5CYkaNlNt7yHHl0KeA95V0by6qQcdnlgKgNyKIaD0tBAwMi2+3Vvo5DVw8482nXzB07AOY
 BX9aXayaPOx/iA2o8wM7fdcndbdLjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfXwdnkPnMewUjC
 w54diype8ZhGqs4y59lSgJPKCEWw+W7gyKW61ZvuYuhRskwFJ0qFq/CyPownX7R6+7UYgCw8HqS
 4zvra+FvRz5ohXEhld/K2nThc+TK3SA=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ada0f7b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=8Y3P-FUPaDH5FmT9qQkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: igs8CrdThXoQyIHS1kvBpKNLtV4l0Ndp
X-Proofpoint-ORIG-GUID: igs8CrdThXoQyIHS1kvBpKNLtV4l0Ndp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610190000 definitions=main-2610220053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_142834_676831_E7754B43 
X-CRM114-Status: GOOD (  20.56  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Let users of aux-hpd, the UCSI and PMIC GLINK drivers pass the IRQ_HPD
events to the DisplayPort drivers.

The drm_aux_hpd_bridge_notify() is kept to ease merging of the series,
preventing extra cross-tree merges. It will be removed once all
drivers are converted. The drm_bridge_hpd_notify() function is kept for
the drivers which only care about the connector status and will always
pass DRM_CONNECTOR_NO_EXTRA_STATUS as the extra status.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 11 +++++++----
 include/drm/bridge/aux-bridge.h         | 13 +++++++++++--
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index a2e525aa5788..930a03496ac5 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -137,16 +137,19 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent, struct device_n
 EXPORT_SYMBOL_GPL(drm_dp_hpd_bridge_register);
 
 /**
- * drm_aux_hpd_bridge_notify - notify hot plug detection events
+ * drm_aux_hpd_bridge_notify_extra - notify hot plug detection events
  * @dev: device created for the HPD bridge
  * @status: output connection status
+ * @event: extra status bits like DRM_CONNECTOR_DP_IRQ_HPD
  *
  * A wrapper around drm_bridge_hpd_notify() that is used to report hot plug
  * detection events for bridges created via drm_dp_hpd_bridge_register().
  *
  * This function shall be called in a context that can sleep.
  */
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+				     enum drm_connector_status status,
+				     enum drm_connector_dp_event event)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
 	struct drm_aux_hpd_bridge_data *data = auxiliary_get_drvdata(adev);
@@ -154,9 +157,9 @@ void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status sta
 	if (!data)
 		return;
 
-	drm_bridge_hpd_notify(&data->bridge, status);
+	drm_bridge_hpd_notify_extra(&data->bridge, status, event);
 }
-EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify);
+EXPORT_SYMBOL_GPL(drm_aux_hpd_bridge_notify_extra);
 
 static int drm_aux_hpd_bridge_attach(struct drm_bridge *bridge,
 				     struct drm_encoder *encoder,
diff --git a/include/drm/bridge/aux-bridge.h b/include/drm/bridge/aux-bridge.h
index c2f5a855512f..233ca885736f 100644
--- a/include/drm/bridge/aux-bridge.h
+++ b/include/drm/bridge/aux-bridge.h
@@ -25,7 +25,9 @@ struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, str
 int devm_drm_dp_hpd_bridge_add(struct device *dev, struct auxiliary_device *adev);
 struct device *drm_dp_hpd_bridge_register(struct device *parent,
 					  struct device_node *np);
-void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status);
+void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+				     enum drm_connector_status status,
+				     enum drm_connector_dp_event event);
 #else
 static inline struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent,
 								    struct device_node *np)
@@ -44,9 +46,16 @@ static inline struct device *drm_dp_hpd_bridge_register(struct device *parent,
 	return NULL;
 }
 
-static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+static inline void drm_aux_hpd_bridge_notify_extra(struct device *dev,
+						   enum drm_connector_status status,
+						   enum drm_connector_dp_event event)
 {
 }
 #endif
 
+static inline void drm_aux_hpd_bridge_notify(struct device *dev, enum drm_connector_status status)
+{
+	drm_aux_hpd_bridge_notify_extra(dev, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+}
+
 #endif

-- 
2.47.3


