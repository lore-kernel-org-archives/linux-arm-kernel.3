Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5C6606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 13:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Llj8Nxgn;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=iNzWQNbS;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HJlErNqe;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f1feErPH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=; b=Llj8Nxgncz9mLa
	jdXxkAPBtbubtwVmSZFkgBuZO10fs+uog20iXIf/A/aLtrT2RnNG1yY3hN6Pq+TFNTcsBCn/F9USO
	i93MhU0uT/aJeIHBcmnWz1AJudOF+nlEUFXfRos4oelw1KFczw9b/TlOb1+6X76s4EbruDookt4Y2
	H2bG0oyNqIXvhRuFT2xcyHO+oqVMrRBtmY2ffDpKq1JPCu4a0kfRGdvyVYpiixS3RanKKYzGqqX8p
	MMRxBwfUKFdtC2LZe8BtlRfXofqCooR70o2APpYp+rSlJOpkiPHvGzv1xSpqJqAY90Y+yA8xCFRTF
	4pqfsbrat7Qjwp48X6ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVl-0000000GPHe-4AJD;
	Fri, 23 Oct 2026 13:40:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVY-0000000GP5N-3yG4
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 Oct 2026 13:40:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=; b=iNzWQNbSJ9ys5kBxp/QdblL9ev
	gNZXk05DPQHDO09jPLpca6ZkV0eZjSxhkLYeYWO38Zi5/56X7kK+oxmHeNJdHAqqnB0h0kMTAuiR1
	+qMS9cCqfMRM27iWaCEASX8a3nd2iJfqT6dIzNhfBd3u6t8PsFV6+fI0MrX4MLcE01TpFxKxNrKQU
	PW7iUwdEhYMpfs0WfbZuUfN+EZmSklXBBXe9X1/msEIPDp/v4rCYhUVxEC+k1YNO5zsqKCWg2Z1ZT
	j1EE8tcM55WIih3iv4e8AJdidL1Jq6dOmXKxB4kQIf2s0Ml7VW86gs2AjCBUoXDQ3MqA21pL3JIFm
	JJOnqpAA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFVV-00000009izj-3HRG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 13:40:31 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NCAanM3822285
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 13:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=; b=HJlErNqekbOdhbGu
	fq2JdyVxxnhNnzhKDDJFKd0T3DVu7DzZmUgPWl6QZKXfvt3vvObkM3tjay+9hwL9
	bieK2sbsTVVU/5P6AbfilMgaXi+1l+64oVUBLC405ul3DaQdghriXAciLH25sdlp
	zAUxptVQ/3LRvJyRmkitrRH1L9N4E2QuCrzaHQet6aKbJzc9K4E7Fkzztv7KtKpG
	Zd/LnXFr0Nwavc109VXGpqqdJ3rHVukP6XHwd2VSGCIPlz4vuUmlVSFmisvoVxkD
	mk1CEEz3V4+xr35FV49nJXDUYWzjq5mNgFsElBMx9Z7ZVdnPLUAbNWNa2sMd6mx9
	4LxOnw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw09yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 13:40:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf6c528aso143300385a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 06:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762825; x=1793367625; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=;
        b=f1feErPHg56GY4QofEMZpiIRk292UQMH26Ia0HhJnV3iNTzm0e5mI5w16Lm6n3lXwQ
         WEHb9yjcV1uoLgCJ0qWWjon8YCja7Ldbh6AUzR4dYJJ3FgXSCMy/z6g5/rTr7XzEqz1+
         RYirxrFlbYGA5UJerQON4GcprIXn2DhEodWUsVzmoRJoXJ2Pj0Nnhrwk3SoLVuhKUl+4
         Yf0cWxAQI1maGEhz8fOCJAxeAx/dhlXm0NKoVq/ju5XBGm1/SVUvB4hzwqk/dhubmw03
         Ftw/PHrub1OMmD6S/dF1kx9Jn7Era3kuaHNqXLU5dcUPNFR6piY+XRahWMxXOnIyATht
         +/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762825; x=1793367625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hdqxyn2F/krFbhfo7FhJaA24z9+SJBSeDt9UzhP3juo=;
        b=ADFKtJjdb/8bxAT1qM1+ziGUZ6aZ96Q1GVu/4oQ2HZ2Q4ya4v5TThHSYqW5vkZgj38
         Zxkkw2j2qb/NFqAFTlz7WdMhGXKuYEGCVhlElYeUVlY6/g1VqU9iS8ndLlezj/Twq+Tf
         ZuJMeEmBjKveiyt2szidmiyFhLaeyNmS/nYc9tgptFVszQUf80TvoDBcm9b8y53qL9Kq
         cZ3naWWAK8HBZDSQ8r+9ekimWpjCTDFWuzxky0fuq1WWvF24ao743lhERuh5qVpmfqkJ
         fnxk2WU4MdNfTRGtxb7clvFlt8FOwR1zvoBlhPVmwiPx9XmI//W9p92GG9vx2Pmv1xHO
         k5Cw==
X-Forwarded-Encrypted: i=1; AKwUvBwZ95qU1J2PNb0FjbEuodt5A4O1Tozu28SJMUiNEBwWa+IbPG0P8yCqKyrIk/qelsAEaJ2eFVlbVx9yNB0E3PHH@lists.infradead.org
X-Gm-Message-State: AFq9FYIDp1/khRolNEHr2Tdyl175f2ZgH9boyLFWFGl1BzUBheX5u6Y/
	uBAj0gBQctxmUAZlSzPEBmT+jDCDZtdpsLlOfq19psfH4jvXehj+y9nEmTKylvVih0+hUJujtq7
	tw0OxPCJHdkH/cGMmLNzZJRaNuHwBiHLFIZ0C1mraYBhfG9DOmEKApsUd5BE1F9R6RtJnWfteK1
	25hg==
X-Gm-Gg: AYBFou2tbAF0UbgN0o84w2ckJtaYy/lMIhZCuDNQEmjvN59G/e9casHfAbyQJFPgLQi
	o3ZQbRWNbHeAWnverL4PCZ3jrzf3ge4JqdxnK8W3f2VeBlANNi78TzrG2q50hvBXLK7aRt3cGjn
	oCFXnFQISPd6TrZ1lTpf+iybOPNTMBKeVwYwTeyW1YwDLSTpWSeqZWrDJzVbG+L1XpbPazZtPT1
	JCqsyYLi8EZC1cJvH/sESoCylgfyNfPTIlXPYam9CMFlG5cF3JMuJEXHHSjYNQEbrwa7pH3FBr0
	EipVUl6f4On2fhqoiBHY+x7R/Zb2DPW4KUawNDj1snKmEoGV6cOTzNL3YfM0XBhzkq+zrC4JkCc
	2Qy9VDTlIwT29oTNROYEOfMYxOcQYqq2dDNCv7jFxVGJvSLJA5R3/6Z3NXxceVr1sA0rPuZREGq
	4HIirBUXiPc3o5
X-Received: by 2002:a05:620a:1793:b0:936:df48:d507 with SMTP id af79cd13be357-93f6f91b90bmr404249185a.18.1792762824577;
        Fri, 23 Oct 2026 06:40:24 -0700 (PDT)
X-Received: by 2002:a05:620a:1793:b0:936:df48:d507 with SMTP id af79cd13be357-93f6f91b90bmr404240185a.18.1792762823901;
        Fri, 23 Oct 2026 06:40:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:45 +0300
Subject: [PATCH v7 5/9] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-hpd-irq-events-v7-5-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
In-Reply-To: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22OpPKFLb0QP2XHRz897yeuMRZWhayLOJL9in
 wL0DwIb9xmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjqQAKCRCLPIo+Aiko
 1WMnB/91SjQ2z1G2jcpsMEUAbLrvbhHjUWRqN9sYOBcBnF+Xi/fsnadkbVkBkay8z9UzDLAAWGm
 ZJay6mLJuy9ZxSPM1Q1KBpJBynYTjlRPeVT6YmBj/i4w/3dpKkd1h94Gqce5bTTVe3nq6ohfcwi
 Q0FZX2plfnEhtE2p2/Hs8JwGikunLW/CTudWq8qotyE00aQtd8EEx73Xf6YxfppACGVESQXt6EQ
 jwiJUlk3B/H4Lu/sM+GsNfAlSQiXTTwlFPUiB0bGv3rJttkVXl3ZlN3ZFbPk4GNyyfGRdDtqX1Q
 uDLK2Zrs89ydnUo86jdmaZFwx0gYui5hMi+aCE6sx8ROdlt4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: J3OIUqHh5xY11sjoZR34jKvdFdwSOOAD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX1Bndj/amzKLw
 jS3tH54cebsiMdwqbD4DSONGgOOJlZNsopxu9rhRwFnqjDx1TIVx13ynuRbzUThAxP+/R9EEUIO
 e7QGHgUnnDlAk2unWCdK02cMPoPsSJw=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb63c9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=8Y3P-FUPaDH5FmT9qQkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: J3OIUqHh5xY11sjoZR34jKvdFdwSOOAD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX86sxeZN/hJwe
 I5T8FzUbHYPQ5fD7VghH0Mu4r106eE8C8mXHAakD2S347GPc9fUDfWTh1KBR0ZJCy5Fs79fjUsZ
 VhlwdpWprZZqRGiJd5aXqn2BzFLxjtrv5nqEZqtpun231s/uh4kLV59r6lI8pJLaIYhNmbhMHkl
 fqyHbA4NM/Xc2NhOcRMmC8kfhmAN+LJ1UQkQtbSK0PbPcUwhbZoUwirgC9j5W4asHGa1YxTGhaG
 Chwj+zAt53Tr96oIgBr9XoLFlvbzqswdQB1WCISSSoJOCOAUXKjq70PbB3OC2XA3WqaOgf85/57
 SHgpqikjOL0tEjk9DR1oHrWzp3czFzyGXCHSVA2hKkVSuP5fidmPUnB+UP417yqMjAxhJmmCAin
 FucobWJ1xnbZIpFqEdaso9YkUvjOMBuwqGk5pkt6br88SJmyP0IyhdeErgX/C1vdXoczrNrCYds
 IEgTkFItK6S/f3yHdXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_144030_323372_332A9650 
X-CRM114-Status: GOOD (  20.18  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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


